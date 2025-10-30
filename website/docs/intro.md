---
sidebar_position: 1
---

# Introduction

Welcome to the **Torizon OS** documentation.

Torizon OS is an embedded Linux distribution for the Torizon platform. It features, among other essential services, a container runtime and components for secure remote over-the-air (OTA) updates.

## What is Torizon OS?

This layer provides metadata to build two distinct Torizon OS flavors:
- **Torizon**: built on top of Toradex's BSP.
- **Common Torizon**: built on top of BSPs from third-parties.

## Getting Started

To build Torizon OS, see the following resources:

### Building Torizon OS
For Toradex hardware, follow the official guide:
- [Build TorizonCore](https://developer.toradex.com/knowledge-base/build-torizoncore)

### Building Common Torizon OS
Choose your hardware platform from the supported options:

- **Texas Instruments** (AM62x/AM62L/AM62P SK EVM and BeagleY-AI)
- **NXP** (i.MX95 Verdin EVK and FRDM i.MX93)
- **STMicroelectronics** (STM32MP1/STM32MP2)
- **Synaptics** (Astra SL1680/Winglet)
- **Renesas** (RZ/V2L EVKIT)
- **Intel** (x86-64)

See the platform-specific documentation in the repository's `docs/` folder for detailed build instructions.

## Contributing

You may also choose to actively fix issues and bugs or possibly port Common Torizon on new devices. Contributions are welcome!

## Support

If you encounter any issues when using or developing Torizon OS, you can:
- Open a new issue in the [GitHub repository](https://github.com/leograba/meta-toradex-torizon)
- Create a new Technical Support topic in the [Toradex Developer Community](https://community.toradex.com/)
