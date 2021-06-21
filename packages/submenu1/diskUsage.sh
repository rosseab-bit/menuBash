#!/bin/bash

diskUsage(){
	df -h | grep "/$"
}
