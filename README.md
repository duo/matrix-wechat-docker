# matrix-wechat-docker
A docker image for [matrix-wechat-agent](https://github.com/duo/matrix-wechat-agent), modified from [docker-ComWechat](https://github.com/tom-snow/docker-ComWechat).

### Usage

```bash
docker run -d \
  --name=matrix-wechat-agent \
  -e WECHAT_HOST=wss://matrix-wechat/_wechat/ \
  -e WECHAT_SECRET=foobar \
  -e VNCPASS=abc `#optional` \
  -p 5905:5905 `#optional` \
  -v /path/to/agent:/home/user/matrix-wechat-agent `#optional` \
  --restart unless-stopped \
  lxduo/matrix-wechat-docker:latest
```

### Parameters
|              Parameter              | Function                        |
| :---------------------------------: | ------------------------------- |
|              `-p 5905`              | VNC access port                 |
|            `-e VNCPASS`             | VNC password                    |
|          `-e WECHAT_HOST`           | matrix-wechat appservice host   |
|         `-e WECHAT_SECRET`          | matrix-wechat appservice secret |
| `-v /home/user/matrix-wechat-agent` | matrix-wechat-agent directory   |
