# postfix image on alpine #
***
see postfix.sh example on github

to start typing something like that:

```docker run -it -d \
-v postfix.sh:/etc/postfix/postfix.sh \
-p "25:25" -p 587:587 axizdkr/postfix```
