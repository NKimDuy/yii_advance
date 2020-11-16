<?php

namespace backend\assets;

use yii\web\AssetBundle;

/**
 * Main backend application asset bundle.
 */
class AppAsset extends AssetBundle
{
    public $basePath = '@webroot';
    public $baseUrl = '@web';
    public $css = [
        'css/site.css',
		'css/fonts/circular-std/style.css',
		'css/style.css',
		'css/fonts/fontawesome/css/fontawesome-all.css',
    ];
    public $js = [
		'js/main-js.js',
		'js/delete-button-create-js.js',
    ];
    public $depends = [
        'yii\web\YiiAsset',
        'yii\bootstrap4\BootstrapAsset',
    ];
}
