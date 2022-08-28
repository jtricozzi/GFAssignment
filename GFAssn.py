import csv
from collections import Counter

cars = set()
rooms = set()
roomList = []
records = []
carPath = indicatorVals = "CAR_"

#Assignment 1:                                  Note: I realize most of these could've been combined into one loop but for the sake of calrity I have separated them by Assignment
with open ('sample_csv_data.csv', 'r') as file:
    data = csv.reader(file)
    next(file)
    for row in data:
        cars.add(row[0])
        rooms.add(row[3])
        roomList.append(row[3])
        records.append(row[2])
    print("Records: " + str(len(records)) + " Cars: " + str(len(cars)) + " Rooms: " + str(len(rooms)))

#Assignment 2:
    file.seek(1)
    cars = list(cars)
    cars.sort()
    for carNum in range(len(cars)):
        carPath += str(carNum+1) + "=>"
        for row in data:
            if row[0] == cars[carNum]:
                carPath += " " + row[3] + "-->"
        print(carPath[:-3])
        file.seek(1)
        carPath = "CAR_"

#Assignment 3:
    file.seek(1)
    redCount, greenCount = 0, 0
    for carNum in range(len(cars)):
        indicatorVals += str(carNum+1) + "=>"
        for row in data:
            if row[0] == cars[carNum]:
                if row[4] == "RED":
                    redCount += 1
                else:
                    greenCount += 1
        print(indicatorVals + "GREEN - " + str(greenCount) + ", RED-" + str(redCount))
        file.seek(1)
        indicatorVals = "CAR_"
        redCount, greenCount = 0, 0

#Assignment 4:
    file.seek(1)
    mostCommonRooms = [item for items, c in Counter(roomList).most_common() for item in [items]]
    print(mostCommonRooms[0], mostCommonRooms[1], mostCommonRooms[2], sep='\n')

file.close()
