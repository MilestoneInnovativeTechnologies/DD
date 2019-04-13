<?php

    namespace Milestone\SS\Interact;

    use Illuminate\Support\Str;
    use Milestone\Appframe\Model\Group;
    use Milestone\Appframe\Model\Role;
    use Milestone\Interact\Table;

    class usermaster implements Table
    {
        public $role_cache = null;
        public $new_role_prefix = 'eplus_';

        public function getModel()
        {
            return Group::class;
        }

        public function getImportAttributes()
        {
            return ['name','title','reference'];
        }

        public function getImportMappings()
        {
            return [
                'reference' => 'CODE',
                'title' => 'NAME',
                'name' => 'getName'
            ];
        }

        public function getName($data){
            return Str::camel($data['NAME']);
        }

        public function getPrimaryIdFromImportRecord($data)
        {
            $group = Group::where('reference',$data['CODE'])->first();
            $group ? $group->id : null;
        }

        public function isValidImportRecord($record){
            return $record['ISGROUP'] === 'Y';
        }
        public function preImport(){
            $this->role_cache = Role::pluck('name','id')->toArray();
        }
        public function recordImported($record,$id){
            $role_name = $this->new_role_prefix . $this->getName($record);
            if(!in_array($role_name,$this->role_cache)) { $role = new Role; $role->unguard(); $role->create(['name' => $role_name, 'title' => $record['NAME']]); $this->preImport(); }
            $role = Role::find(array_search($role_name,$this->role_cache));
            $role->Groups()->attach($id);
        }

        public function getExportMappings()
        {
            // TODO: Implement getExportMappings() method.
        }

        public function getExportAttributes()
        {
            // TODO: Implement getExportAttributes() method.
        }
    }