# App框架定制

在使用honeycomb体系时，并不强制要求使用honeybee的框架。

在上手的过程中，每个团队基本上都会有现有的应用框架。 Honeycomb并不限制必须使用honeybee框架，通过简单的几部定制，现有的应用就可以快速的运行到Honeycomb-server中，并具有同样的灵活性。

同时通过本篇中提及的完整的定制要点，你的app将可以获得更好的支持。

同时官方开源提供 hc-express, hc-koa, hc-egg 三种常用框架的定制版本。

### 1. package.main 指向入口文件

app的入口文件，必须在package.json里面指定。

### 2. app配置定制：接收服务端私有配置

app在运行时，会传递以下环境变量，在这个变量中
```
let envConfig = process.env.HC_APP_CONFIG
/**
 * @type {Object}
 * {
 *   file: app's enter file
 *   appId: appId
 *   config:  app's private config,
 *   serverRoot: honeycomb install root, // std cfg: serverRoot
 *   serverEnv: serverEnv,  // std cfg: serverFlag
 *   appRoot: appRoot,      // std cfg: appRoot
 *   targetSock: targetSock which app listen to
 * }
 */
envConfig = JSON.parse(envConfig);

```

### 3. app入口定制：修改监听

```
app.run = function (callback) {
  server.listen(targetSock);
  
	callback(null, {
      bind: '8999',
      router: '/example',
      target: sock, // 
      param: {
        // nginx server section
        server: {
          ssl_certificate: path_to_crt.pem,
          ssl_certificate_key: path_to_key.pem
        },
        // nginx location section
        location: {
          client_max_body_size: '100m'
        }
      }
  });
}
```


### 4. app日志配置：支持日志查询

app的日志文件，默认抓取来自 $honeycomb_install_dir/logs/, 并抓取特征为：
```
xxxx.yyyy-mm-dd.log 
```
类似的文件。

如果日志文件的名字比较特殊，可以在config中定制规则:
```
TODO server 定制规则
```

日志的查询，同样有个日志格式的限制，最简单的方式，是使用litelog来替换现有log。
```
const litelog = require('litelog');

const log = litelog.create({
  sys: {
    file:
    ratation: 
  },
  access: {
  
  }
});
```

或者可以通过修改配置来完成日志格式的兼容:

```
TODO 日志定制
```