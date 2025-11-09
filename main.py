#!/usr/bin/env python3
"""
Sample application for demonstrating GitHub Actions matrix builds.
This script displays system and Python environment information.
"""

import sys
import platform
import json
from datetime import datetime


def get_system_info():
    """Gather system and Python environment information."""
    return {
        "python_version": sys.version,
        "python_version_info": {
            "major": sys.version_info.major,
            "minor": sys.version_info.minor,
            "micro": sys.version_info.micro,
        },
        "platform": platform.platform(),
        "machine": platform.machine(),
        "processor": platform.processor(),
        "architecture": platform.architecture()[0],
        "system": platform.system(),
        "timestamp": datetime.utcnow().isoformat() + "Z",
    }


def main():
    """Main function to display system information."""
    print("=" * 60)
    print("GitHub Actions Matrix Build - System Information")
    print("=" * 60)
    
    info = get_system_info()
    
    print(f"\nPython Version: {info['python_version_info']['major']}.{info['python_version_info']['minor']}.{info['python_version_info']['micro']}")
    print(f"Platform: {info['platform']}")
    print(f"Machine: {info['machine']}")
    print(f"Architecture: {info['architecture']}")
    print(f"System: {info['system']}")
    print(f"Timestamp: {info['timestamp']}")
    
    # Save to JSON file
    with open('system-info.json', 'w') as f:
        json.dump(info, f, indent=2)
    
    print("\nSystem information saved to: system-info.json")
    print("=" * 60)
    
    return 0


if __name__ == "__main__":
    sys.exit(main())
