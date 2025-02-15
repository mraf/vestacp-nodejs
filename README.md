# VestaCP with Node.JS support.

Run Node.JS web apps automatically using NGINX reverse proxy, UNIX sockets and PM2.

## Usage.

- PM2 must be installed.
- Node App Default port 3000
- The app must be copied in `/home/user/web/<domain>/nodeapp/`
- The app entry point must be specify in `package.json` file, with `"main":"<you_init_script.js>"` if your file are not have this entry, script use default one `/home/user/web/domain/nodeapp/app.js`
- The app must listen on a UNIX socket in `/home/user/web/domain/nodeapp/app.sock`
- Upload `NodeJS.tpl`, `NodeJS.stpl`, `NodeJS.sh` to `/usr/local/vesta/data/templates/web/nginx/` or run `install.sh`
- In the control panel, select NodeJS from Proxy Template
- If you install NVM for different version of Node script read `.nvm`, `.node-version` file from node app folder auto install it an run whith specify version
- Load Enviroment variables from `.env` file located in same node app folder
- Added watch mode on update of touch some file on Node folder the server automatically restart's

![VestaCP](https://logico.com.ar/img/2019/04/21/vestacp_proxy_setup.png)

### Sample

`admin <domain> 127.0.0.1 /home`
`/usr/local/vesta/data/templates/web/nginx/NodeJS.sh admin default 127.0.0.1 /home`

#### Sudo commands

* Remove all instances: `runuser -l <user> -c "pm2 del all"` for admin `runuser -l admin -c "pm2 del all"`
* List all instances: `runuser -l <user> -c "pm2 list"` for admin `runuser -l admin -c "pm2 list"`
* Show monitor of instances: `runuser -l <user> -c "pm2 monit"` for admin `runuser -l admin -c "pm2 monit"`


#### Documentation

Pm2: [https://pm2.keymetrics.io/docs/usage/quick-start/]