FROM mcr.microsoft.com/dotnet/core/sdk:2.2

# image tag: mslearn-hotel-reservation-system
WORKDIR /content
COPY mslearn-hotel-reservation-system/src .
RUN dotnet restore "HotelReservationSystem/HotelReservationSystem.csproj"
WORKDIR "/content/HotelReservationSystem"
RUN dotnet build "HotelReservationSystem.csproj" -c Release -o /content/bin
EXPOSE 80
WORKDIR /content/bin
ENTRYPOINT ["dotnet", "HotelReservationSystem.dll"]
