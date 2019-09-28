<?php
return [
    'sspi' => [
        'driver' => 'local',
        'root' => public_path('images/product'),
        'url' => 'http://' . request()->getHost() . '/images/product',
        'visibility' => 'public',
    ]
];
