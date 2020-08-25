ARG platform_arg

FROM docker.pkg.github.com/virtocommerce/vc-platform/platform:${platform_arg}

RUN apt-get update
RUN apt-get install -y openssh-server unzip curl
COPY wait-for-it.sh /wait-for-it.sh

RUN apt-get update && apt-get install -y dos2unix && dos2unix /wait-for-it.sh && chmod +x /wait-for-it.sh

WORKDIR /opt/virtocommerce/platform

ENTRYPOINT ["dotnet", "VirtoCommerce.Platform.Web.dll"]