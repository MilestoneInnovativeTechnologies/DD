<ol>
<li>composer require milestone/ss</li>
<li>php artisan vendor:publish --provider=Milestone\Interact\InteractServiceProvider</li>
<li>Change config -> interact -> namespace => Milestone\\SS\\Interact</li>
<li>composer require doctrine/dbal</li>
<li>php artisan migrate</li>
<li>php artisan db:seed --class=Milestone\SS\Seeder\DatabaseSeeder</li>
<li>php artisan db:seed --class=Milestone\SS\Seeder\SSDatabaseSeeder</li>
</ol>