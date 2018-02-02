# App开发

honeycomb支持三种类型的app:

* web server 传统的web服务，http/https 协议（包含websocket）
* socket server tcp协议的服务
* daemon server 后台任务型server

目前我们提供了与之配对的app framework框架hc-bee（npm中）

适配exress、koa、egg框架的工作还在筹备中(hc-koa, hc-egg)，有兴趣可以参考[App框架定制章节]，一起参与进来

### 使用hc-express开发web app

安装honeycomb-cli:
```
npm i -g honeycomb-cli
```

honeycomb命令提供模板应用的功能，可以快速搭建demoapp：

```
honeycomb init $appName
```

上述命令将初始化一个简单honeycomb app样板，包含工程结构、前端开发环境、打包测试脚本等等。

```
> cd $appName
> honeycomb start 
```
启动样板工程，即可开始开发。



### package.json配置


package.json 必须配置的几个字段：

```
{
  "name": "appName",  // 应用名，必须有
  "version": "0.0.1", // 版本号，必须有，遵循semver
  "build": "1",       // build number， 可选，根据自己的版本规划
  "main": "app.js",   // 应用的主入口，如果不提供，会寻址到index.js
}
```


### 调试App

编写完以上简单case，使用honeycomb-cli来启动本地调试：
```
> cd $app_root
> honeycomb start
```
启动之后，就可以通过浏览器来测试服务了


### 打包App

honeycomb-cli 提供了打包命令
```
> cd $appDir
> honeycomb package
```

打包动作执行完之后，会在`$appDir/out`下生成应用包(tgz包)，其命名规则为(由package的配置决定):

```
${package.name}_${version}_${build}.tgz
```

### 发布App

打开console，选择要发布的集群，手动发布打包完的app包即可


