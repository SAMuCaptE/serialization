# Dataset

The protobuf definition can be found [here](../schemas/dataset.proto).

## Max size

The max size was calculated using the max values of these sensors ([reference](https://github.com/SAMuCaptE/loch/blob/main/tests/scheduler_tests/fuzz/sensor_scheduler.fuzz.md)) using [protobufpal.com](https://www.protobufpal.com/):

- 2 conductivity sensors
- 2 temperature sensors
- 2 pH sensors

<details>
<summary>Test data</summary>

```json
{
  "start_time": 1709839797523,
  "end_time ": 1709839797524,
  "next_wakeup_time ": 1709839797525,
  "next_sync_time ": 1709839797526,
  "data": [
    {
      "sensor_id": 0,
      "integer_part": { "unsigned": 54999 },
      "decimal_part": 999
    },
    {
      "sensor_id": 1,
      "integer_part": { "unsigned": 54999 },
      "decimal_part": 999
    },
    {
      "sensor_id": 2,
      "integer_part": { "signed": 34 },
      "decimal_part": 999
    },
    {
      "sensor_id": 3,
      "integer_part": { "signed": 34 },
      "decimal_part": 999
    },
    {
      "sensor_id": 4,
      "integer_part": { "unsigned": 13 },
      "decimal_part": 999
    },
    {
      "sensor_id": 5,
      "integer_part": { "unsigned": 13 },
      "decimal_part": 999
    }
  ]
}
```

</details>

<details>
<summary>Encoded data (49 bytes)</summary>

```
0x08 0x93 0x9A 0x93 0xD3 0xE1 0x31 0x2A 0x05 0x08 0x00 0x20 0xE7 0x07 0x2A 0x05 0x08 0x01 0x20 0xE7 0x07 0x2A 0x05 0x08 0x02 0x20 0xE7 0x07 0x2A 0x05 0x08 0x03 0x20 0xE7 0x07 0x2A 0x05 0x08 0x04 0x20 0xE7 0x07 0x2A 0x05 0x08 0x05 0x20 0xE7 0x07
```

</details>

## Optimization

If necessary, the proposed schema could be optimized by combining fields together beforehand.

- Datetimes could be expressed in seconds with `t=0` being the launch date. This would fit in a `uint32`.
- 2 datetimes could be combined in a `uint64`. (This would remove a protobuf metadata byte)
- `SensorValue` could be replaced by a single `uint32` .
  > `integer_part << 16 | decimal_part << 3 | sensor_id`
  - `integer_part` takes up to 16 bits. There should be a mechanism to detect potential negative values.
  - `decimal_part` can be up to 999, which takes up 10 bits.
  - `sensor_id` takes up 3 bits, which allows up to 8 different sensors.
