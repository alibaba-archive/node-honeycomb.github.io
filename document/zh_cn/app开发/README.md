# App开发

honeycomb支持三种类型的app:

* web server 传统的web服务，http/https 协议（包含websocket）
* socket server tcp协议的服务
* daemon server 后台任务型server

目前我们提供了与之配对的app开发框架 hc-bee

适配exress、koa、egg框架的工作还在筹备中(hc-koa, hc-egg)，有兴趣可以参考[App框架定制章节]，一起参与进来。

本章主要介绍基于 hc-bee框架 开发应用。

## hc-bee

hc-bee是基于Express.js(v4.x)实现的一套框架，经典的middleware形式, 同时增加了对genator、async的支持。

hc-bee实现了框架定制中提到的所有特性， 和honeycomb-server完美集成（配置、日志、监控），结合模板工程，可以快速完成产品开发。


#### 1. 插件机制

hc-bee实现了一套插件机制，支持挂载 middleware、extension 两种类型的插件。

* middleware 作为用户请求必经的处理handler
* extension 作为对 req、res的能力增强

#### 2. 路由机制

hc-bee无需自己编写路由表，可根据 ***控制器的注释*** 自动扫描生产路由, 在controller目录下的文件，按如下规则编写controller的handler方法，可以实现接口路由、文档自动生成：

```
/**
 * @api POST /api/upfile
 * @body
 *         name {String}
 *         file {Path}
 * @success
 *         {"code": "SUCCESS"}
 * @error
 *         {"code": "ERROR"}
 */
exports.upload = function (req, callback) {
    let body = req.body;
  // todo something
  callback(null);
};
```



