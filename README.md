# ChimbaBench [![Github Releases](https://img.shields.io/github/downloads/Shedou/ChimbaBench/total.svg)](https://github.com/Shedou/ChimbaBench/releases)

## Описание | Description
Портативное многофункциональное приложение включающее в себя тесты производительности и дополнительные инструменты для получения информации о системе.

A portable multifunctional application that includes performance tests and additional tools for obtaining information about the system.

<details>
  <summary>Возможности | Features:</summary>

- **System Info:** Набор команд и дополнительных приложений для получения разнообразной информации.
- **Font Test:** Здесь можно протестировать шрифты.
- **Simple Box:** Простой тест производительности.
- **GPU Heavy:** Более сложный тест производительности для видеокарт.

English translation:

- **System Info:** A set of commands and additional applications for obtaining a variety of information.
- **Font Test:** Fonts can be tested here.
- **Simple Box:** Simple performance test.
- **GPU Heavy:** More difficult benchmark for graphics cards.

</details>

**ChimbaBench v2.6:**

||||
|---|---|---|
| ![Screenshot_2023-10-04_22-34-50](https://github.com/Shedou/ChimbaBench/assets/19572158/84479f55-b70a-4337-9562-a3503c91f377) | ![Screenshot_2023-10-04_22-34-56](https://github.com/Shedou/ChimbaBench/assets/19572158/906fc4ad-817b-48f9-b33e-f9d74f73cc94) | ![Screenshot_2023-10-04_22-35-03](https://github.com/Shedou/ChimbaBench/assets/19572158/48794d3e-52f5-47cc-90f4-a0a3f292ec0c) |
| ![Screenshot_2023-10-04_22-35-43](https://github.com/Shedou/ChimbaBench/assets/19572158/f66ec95b-0bf5-44bf-a1c0-9928f4f43860) | ![Screenshot_2023-10-04_22-35-53](https://github.com/Shedou/ChimbaBench/assets/19572158/660dec3b-2978-430f-93a7-098b0f8bb980) | ![Screenshot_2023-10-04_22-36-11](https://github.com/Shedou/ChimbaBench/assets/19572158/8316ad36-184f-4c1e-8c9b-1e32169fc96a) |

|||
|---|---|
| ![Screenshot_2023-10-04_22-38-05](https://github.com/Shedou/ChimbaBench/assets/19572158/c95a4fd9-c062-4e2d-b16e-331bf7382d57) | ![Screenshot_2023-10-04_22-39-41](https://github.com/Shedou/ChimbaBench/assets/19572158/9491cc79-7015-467e-aefd-8c04d4ba136a) |

## Загрузки | Downloads
### Текущая версия | Current version: [ChimbaBench v2.6](https://github.com/Shedou/ChimbaBench/releases/tag/v26) - [![Github Releases](https://img.shields.io/github/downloads/Shedou/ChimbaBench/v26/total.svg)](https://github.com/Shedou/ChimbaBench/releases/tag/v26)

<details>
  <summary>Предыдущие версии | Previous versions:</summary>

- [ChimbaBench v2.4](https://github.com/Shedou/ChimbaBench/releases/tag/v25)
- [ChimbaBench v2.4](https://github.com/Shedou/ChimbaBench/releases/tag/v24)
- [ChimbaBench v2.3](https://github.com/Shedou/ChimbaBench/releases/tag/v23)
- [ChimbaBench v2.2](https://github.com/Shedou/ChimbaBench/releases/tag/v22)
- [ChimbaBench v2.1](https://github.com/Shedou/ChimbaBench/releases/tag/v21)
- [ChimbaBench v2.0](https://github.com/Shedou/ChimbaBench/releases/tag/v20)
- [ChimbaBench v1.3](https://github.com/Shedou/ChimbaBench/releases/tag/v1.3)
- [ChimbaBench v1.2](https://github.com/Shedou/ChimbaBench/releases/tag/v1.2)
- [ChimbaBench v1.1](https://github.com/Shedou/ChimbaBench/releases/tag/v1.1)
- [ChimbaBench v1.0](https://github.com/Shedou/ChimbaBench/releases/tag/v1.0)

</details>

## Известные проблемы | Known problems

<details>
  <summary>LLVMpipe Driver Problem...</summary>

|![402466_O](https://github.com/Shedou/ChimbaBench/assets/19572158/81a5e3bf-c93b-465e-bc7e-33a605f0b480)|![402468_O](https://github.com/Shedou/ChimbaBench/assets/19572158/e56d2dad-17ad-4cfd-b772-fde53164d05c)|![401490_O](https://github.com/Shedou/ChimbaBench/assets/19572158/69f13a37-c5a2-4fed-83e7-ee663c513ba6)|
|-|-|-|

https://overclockers.ru/blog/Hard-Workshop/show/101225/llvmpipe-problema-sovremennyh-distributivov-linux-polomali-chto-rabotalo

https://overclockers.ru/blog/Hard-Workshop/show/100259/llvmpipe-problema-sovremennyh-distributivov-linux

</details>

<details>
  <summary>ChimbaBench v2.6 and older:</summary>

- Длительность теста увеличивается если FPS ниже 8, результаты могут быть искажены. (неправильно работают стандартные таймеры Godot Engine если FPS ниже 8).
- The duration of the test increases if FPS is below 8, the results may be distorted. (standard Godot Engine timers do not work correctly if FPS is below 8).

</details>

## Системные требования | System requirements:
- Windows 7+
- Linux дистрибутивы 2013 года и новее | Linux distributions 2013 year and newer (requires GLIBC 2.17 or later)
- OpenGL 3.x (minimum OpenGL 2.1 / OpenGL ES 2.0)

## License "ChimbaBench"
ChimbaBench\
Copyright (C) 2023 Chimbal\
This program is free software: you can redistribute it and/or modify\
it under the terms of the GNU General Public License as published by\
the Free Software Foundation, either version 3 of the License, or\
any later version.\
This program is distributed in the hope that it will be useful,\
but WITHOUT ANY WARRANTY; without even the implied warranty of\
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\
GNU General Public License for more details.\
You should have received a copy of the GNU General Public License\
along with this program.  If not, see https://www.gnu.org/licenses/.

## License "GODOT Engine"
GODOT Engine - https://godotengine.org/license

## Other licenses
Any third party are subject to their own licenses.

## Project status
In the work.
