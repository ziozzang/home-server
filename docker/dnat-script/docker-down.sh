#!/bin/bash
iptables-save | grep -v "portford" | iptables-restore
