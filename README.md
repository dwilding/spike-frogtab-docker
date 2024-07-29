# Notes to self…

Build an image:

```
docker build -t frogtab-server .
```

Run the image in detached mode:

```
docker run -d -p 8080:80 --name running-frogtab-server frogtab-server
```

View the output at http://127.0.0.1:8080/