#!/usr/bin/env python3

import python_weather
import asyncio
import os

async def getWeather():
    #declare client
    async with python_weather.Client(format=python_weather.METRIC) as client:

        #Get weather from rochester
        weather = await client.get("Rochester")

        print(str(weather.current.temperature) + 'C')

if __name__ == "__main__":
    if os.name == "nt":
        asyncio.set_event_loop_policy(asyncio.WindowsSelectorEventLoopPolicy())
    asyncio.run(getWeather())

