<?php

namespace Milestone\SS\Model;

//use Illuminate\Database\Eloquent\Model;
use Milestone\Appframe\Model\Model;
use Milestone\SS\Events\PrintingRecordCreating;
use Milestone\SS\ModelTraits\PrintingDefaults;

class Printing extends Model
{

    use PrintingDefaults;

    protected $table = 'printings';

    public $files = ['file'];

    protected $dispatchesEvents = [
        'creating' => PrintingRecordCreating::class
    ];

}
