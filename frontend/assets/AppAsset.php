<?php

namespace frontend\assets;

use yii\web\AssetBundle;

/**
 * Main frontend application asset bundle.
 */
class AppAsset extends AssetBundle
{
    public $basePath = '@webroot';
    public $baseUrl = '@web';
    public $css = [
		'css/my-css.css',
        'css/site.css',
    ];
    public $js = [
		'js/check-semester.js',
		'js/dataTable.js',
    ];
    public $depends = [
        'yii\web\YiiAsset',
        'yii\bootstrap4\BootstrapAsset',
		'yii\jui\JuiAsset',
    ];
}
