#!/bin/bash

diskUsageDev(){
	df -h | grep "/dev$"
}
