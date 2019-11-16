<?php

namespace Milestone\SS\Events;

use Illuminate\Broadcasting\Channel;
use Illuminate\Queue\SerializesModels;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Storage;
use Milestone\Appframe\Model\ResourceFormUpload;
use Milestone\SS\Model\Printing;

class PrintingRecordCreating
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public function __construct($model)
    {
        $this->setDefaultAttributes($model);
        $this->processFromFile($model);
    }

    public function setDefaultAttributes($model){
        if(!$model->name) $model->setAttribute('name',date('YmdHis'));
        if($model->fncode){
            if(!$model->query1) $model->setAttribute('query1',Arr::get(Printing::$query1,$model->fncode));
            if(!$model->query1_props) $model->setAttribute('query1_props',Arr::get(Printing::$query1_props,$model->fncode));
            if(!$model->template) $model->setAttribute('template',Arr::get(Printing::$template,$model->fncode));
        }
        return $model;
    }

    public function processFromFile($model){
        if(!$model->file) return $model;
        $RFU = ResourceFormUpload::find($model->file);
        $file = implode([trim($RFU->path,DIRECTORY_SEPARATOR),trim($RFU->file,DIRECTORY_SEPARATOR)],DIRECTORY_SEPARATOR);
        $content = explode(PHP_EOL,trim(Storage::disk($RFU->disk)->get($file)));
        if(!is_array($content) || empty($content)) return $model;
        $record = []; $current = null;
        foreach ($content as $data){
            $data = trim($data); if(!$data || in_array(substr($data,0,1),['#','/',';'])) continue;
            if(substr($data,0,1) === '[' && substr($data,-1,1) === ']'){
                $current = substr($data,1,-1);
                $record[$current] = [];
                continue;
            }
            if(!$current) continue;
            $record[$current][] = $data;
        }
        if(empty($record)) return $model;
        foreach ($record as $key => $dataArray) $model->setAttribute($key,implode(PHP_EOL,$dataArray));
        return $model;
    }

    public function broadcastOn()
    {
        return new PrivateChannel('channel-name');
    }
}
