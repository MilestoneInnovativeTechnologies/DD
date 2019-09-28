<?php

namespace Milestone\SS;

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\ServiceProvider;

class SSServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
        $this->mergeConfigs();
        $this->registerBlueprintMacro();
    }

    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
        $this->loadMigrations();
        $this->loadRoutes();
    }



    private function getRootPath(){ return __DIR__ . '/..'; }
    private function getProjectMigrationPath(){ return $this->getRootPath() . '/migrations/'; }
    private function getProjectRoutesPath(){ return $this->getRootPath() . '/routes/'; }
    private function getProjectConfigPath(){ return $this->getRootPath() . '/config/'; }



    private function registerBlueprintMacro(){
        Blueprint::macro('foreignCascade',function($field,$table){
            $this->unsignedBigInteger($field)->index();
            $this->foreign($field)->references('id')->on($table)->onUpdate('cascade')->onDelete('cascade');
        });
        Blueprint::macro('foreignNullable',function($field,$table){
            $this->unsignedBigInteger($field)->nullable()->index();
            $this->foreign($field)->references('id')->on($table)->onUpdate('cascade')->onDelete('set null');
        });
    }



    private function mergeConfigs(){
        $this->mergeConfigFrom($this->getProjectConfigPath() . 'filesystems.disks.php', 'filesystems.disks');
    }

    private function loadMigrations(){
        $source = $this->getProjectMigrationPath();
        $this->loadMigrationsFrom($source);
    }

    private function loadRoutes(){
        $routeFiles = ['web.php','api.php'];
        foreach ($routeFiles as $routeFile)
            $this->loadRoutesFrom($this->getProjectRoutesPath() . $routeFile);
    }
}
