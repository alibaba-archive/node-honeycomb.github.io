## hc-bee

### hc-bee基于Express.js

hc-bee目前基于最新的express4.x版本，经典的middleware形式，集成了genator支持（未来node8 LTS之后，将加入async/await的支持）。

hc-bee和honeycomb-server集成，在配置、日志、插件机制、路由上做了一些封装，为app开发提供方便。

### 插件机制
hc-bee自带了类似Eggjs的插件机制，支持挂载 middleware、extension 两种类型的插件。

* middleware 作为用户请求必经的处理handler
* extension 作为对 req、res的能力增强

### 路由自动扫描功能
Honeybee 自带一个方便的路由自动生成器, 在controller目录下的文件，按如下规则编写controller的handler方法，可以实现接口路由、文档自动生成：

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