### **Uninstaller & HWID Masker**

---

### Overview

This project contains a set of Bash scripts designed to uninstall Apex Legends, remove all traces of its files, modify hardware identifiers (HWIDs), mask IP addresses, and perform additional system configurations. The scripts are intended for use on Linux systems.

---

### Requirements

- Linux OS
- Bash Shell
- Root (sudo) privileges

### Files Overview

1. **Step 1: Uninstalling and Clearing Traces of Apex Legends (You can skip this if you don't play apex legends.)
   - **Filename:** `step1_uninstall_apex.sh`
   - **Description:** Uninstalls Apex Legends and removes all associated files, including Easy Anti-Cheat.

2. **Step 2: Editing HWID Registry Keys**
   - **Filename:** `step2_edit_hwid.sh`
   - **Description:** Creates udev rules to change hardware identifiers of USB devices.

3. **Step 3: Masking and Setting Up Your IP Address**
   - **Filename:** `step3_mask_ip.sh`
   - **Description:** Changes the IP address and optionally sets up a VPN or proxy.

4. **Step 4: Changing the Disk Serial Number (UUID)**
   - **Filename:** `step4_change_uuid.sh`
   - **Description:** Changes the UUID of a specified disk partition.

5. **Step 5: Changing the HWIDs of Everything**
   - **Filename:** `step5_change_all_hwids.sh`
   - **Description:** Changes hardware identifiers, including UUID, MAC address, and hostname.

6. **Step 6: Change Monitor HWID**
   - **Filename:** `step6_change_monitor_hwid.sh`
   - **Description:** Modifies the monitor's HWID by editing and applying a new EDID.

7. **Step 7: Hide Mouse, Keyboard, and Controller Serial Numbers**
   - **Filename:** `step7_hide_serials.sh`
   - **Description:** Creates udev rules to hide or modify the serial numbers of mouse, keyboard, and controller devices.

---

### How to Use

1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/amaralkaff/apex-uninstaller-hwid-masker.git
   cd apex-uninstaller-hwid-masker
   ```

2. Grant execute permissions to the scripts:

   ```bash
   chmod +x *.sh
   ```

3. Run each script in sequence:

   ```bash
   sudo ./step1_uninstall_apex.sh
   sudo ./step2_edit_hwid.sh
   sudo ./step3_mask_ip.sh
   sudo ./step4_change_uuid.sh
   sudo ./step5_change_all_hwids.sh
   sudo ./step6_change_monitor_hwid.sh
   sudo ./step7_hide_serials.sh
   ```

   > **Note:** Some scripts may prompt for manual actions. Please read the output and follow the instructions.

4. Verify the changes by checking system logs or running relevant system commands.

---

### Disclaimer

This project is intended for educational purposes only. Use these scripts at your own risk. The author is not responsible for any damages or legal issues that may arise from using these scripts.

---

### License

This project is licensed under the MIT License. See the [LICENSE](./LICENSE) file for details.

---
