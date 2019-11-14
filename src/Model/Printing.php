<?php

namespace Milestone\SS\Model;

//use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;
use Milestone\Appframe\Model\Model;
use Milestone\Appframe\Model\ResourceFormUpload;

class Printing extends Model
{
    protected $table = 'printings';

    public $files = ['file'];

    public static function boot(){
        parent::boot();
        static::saving(function($model){
            if(!$model->file) return true;
            if(!$model->name) $model->setAttribute('name',date('YmdHis'));
            $RFU = ResourceFormUpload::find($model->file);
            $file = implode([trim($RFU->path,DIRECTORY_SEPARATOR),trim($RFU->file,DIRECTORY_SEPARATOR)],DIRECTORY_SEPARATOR);
            $content = explode(PHP_EOL,trim(Storage::disk($RFU->disk)->get($file)));
            if(!is_array($content) || empty($content)) return;
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
            if(empty($record)) return;
            foreach ($record as $key => $dataArray) $model->setAttribute($key,implode(PHP_EOL,$dataArray));
        });
    }
}
