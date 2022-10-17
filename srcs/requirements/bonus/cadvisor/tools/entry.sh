#!/bin/bash


echo "ℹ️  cadvisor running"
/cadvisor --port=2000 > /dev/null 2>&1
