# build-python-api
Building a REST API in python

All response will have the form

```json
{
    "data": "Mixed type holding the content of the response",
    "message": "Description of what happened
}
```

Subsequent response definition will only detail the expected value of the `data field`

### List all devices

**Definition**

`GET /devices`

**Response**

- `200 OK` on success

```json
[
    {
        "identifier": "floor-lamp",
        "name": "Floor Lamp",
        "device_type": "switch",
        "controller_gateway": "192.1.68.0.2"
    },
    {
        "identifier": "smasung-tv",
        "name": "Living Room Tv",
        "device_type": "tv",
        "controller_gateway": "192.1.68.0.9"
    }
]
```

### Registering a new device

**Definition**

`POST /devices`

**Arguements**

- `"identifier":string` a globally unique identifier for the device
- `"name":string` a friendly name of this device
- `"device_type":string` the type of the device as understood by the client
- `"controller_gateway":string` the IP address of the device's controller

If a device with the given identifier already exists, the existing device will be overwritten.

**Response**

- `200 Created` on success

```json
{
    "identifier": "floor-lamp",
    "name": "Floor Lamp",
    "device_type": "switch",
    "controller_gateway": "192.1.68.0.2"
}
```

## lookup device details

`GET /device/<identifier>`

**Response**

- `404 Not Found` if the device does not exist
- `200 OK` on success

```json
{
    "identifier": "smasung-tv",
    "name": "Living Room Tv",
    "device_type": "tv",
    "controller_gateway": "192.1.68.0.9"
}
```

## Delete a device

**Definition**

`DELETE /device/<identifier>`

**Response**

- `404 Not Found` if the device does not exist
- `204 No content` 


