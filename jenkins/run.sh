
docker run --name jenkins \
           -l traefik.backend=jenkins \
           -l traefik.port=8080\
           -l traefik.frontend.rule=PathPrefix \
           -l traefik.frontend.value=/jenkins \
           -l traefik.frontend.passHostHeader=true \
           jenkins:1.642.2 --prefix=/jenkins
