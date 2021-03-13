# Shadowsocksr Setup

## Installation
```bash
git clone https://github.com/shadowsocksrr/shadowsocksr.git
```

## Configuration

Edit config file `config.json`


## Alias

```bash
echo "alias ssr='nohup python ~/App/shadowsocksr/shadowsocks/local.py -c ~/App/shadowsocksr/config.json 2>&1 > /tmp/ssr.log &'" >> ~/.zshrc
```

## Start

```bash
ssr
```

## Advanced

Convert SOCKS5 proxy to http proxy by [privoxy](https://www.privoxy.org/)

