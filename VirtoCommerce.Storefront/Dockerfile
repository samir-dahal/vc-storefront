#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-buster-slim AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/core/sdk:3.1-buster AS build
WORKDIR /src
COPY ["VirtoCommerce.Storefront/VirtoCommerce.Storefront.csproj", "VirtoCommerce.Storefront/"]
COPY ["VirtoCommerce.Storefront.Model/VirtoCommerce.Storefront.Model.csproj", "VirtoCommerce.Storefront.Model/"]
COPY ["VirtoCommerce.LiquidThemeEngine/VirtoCommerce.LiquidThemeEngine.csproj", "VirtoCommerce.LiquidThemeEngine/"]
RUN dotnet restore "VirtoCommerce.Storefront/VirtoCommerce.Storefront.csproj"
COPY . .
WORKDIR "/src/VirtoCommerce.Storefront"
RUN dotnet build "VirtoCommerce.Storefront.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "VirtoCommerce.Storefront.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "VirtoCommerce.Storefront.dll"]
