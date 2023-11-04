#!/bin/bash
for name in _*.lua; do mv "$name" "${name#*_}"; done
