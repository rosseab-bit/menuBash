#!/bin/bash

diskUsageHome(){
	df -h | grep "/home$"
}
