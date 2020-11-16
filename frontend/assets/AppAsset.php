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
		'https://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css',
    ];
    public $js = [
		'js/dataTable.js',
		'https://code.jquery.com/jquery-3.5.1.js',
		'https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js',
    ];
    public $depends = [
        'yii\web\YiiAsset',
        'yii\bootstrap4\BootstrapAsset',
		
    ];
}
