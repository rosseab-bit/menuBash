#!/bin/bash

diskUsageVar(){
	df -h | grep "/var$"
}
