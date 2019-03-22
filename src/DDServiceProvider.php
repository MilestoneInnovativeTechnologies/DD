<?php

namespace Milestone\SS;

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\ServiceProvider;

class DDServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
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
    }

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

    private function loadMigrations(){
        $source = $this->getProjectMigrationPath();
        $this->loadMigrationsFrom($source);
    }

    private function getProjectMigrationPath(){
        return __DIR__ . '/../migrations';
    }
}
