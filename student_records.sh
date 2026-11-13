#!/bin/bash

# STUDENT RECORDS MANAGEMENT SYSTEM

# Database file
database="students.txt"

# Create database if it doesn't exist
touch "$database"

# Function 1: Register student 
register_student() {
	read -r -p "Enter student name: " name 
	read -r -p "Enter student course: " course 
	echo "$name | $course" >> "$database"
	echo "Student registered successfully!"
}

# Function 2: View students
view_students() {
	echo "REGISTERED STUDENTS"

	if [ -s "$database" ]; then
		cat "$database"
	else 
		echo "No student records found."
	fi 
}

# Function 3: Search student
search_student() {
	read -r -p "Enter student name to search: " name
	if grep -i -F -q -- "$name" "$database"; then 
		echo "Student record found:"
		grep -i -F -- "$name" "$database"
	else 
		echo "Student not found."
	fi 
}

# Function 4: Count students
count_students() {
	total=$(wc -l < "$database")
	echo "Total student records: $total"
}

Main menu
while true
do 

	echo ""
	echo "==================== STUDENT RECORDS SYSTEM ===================="
	echo "1. Register student"
	echo "2. View students"
	echo "3. Search students"
	echo "4. Count students"
	echo "5. Exit"
	echo "================================================================="

	read -r -p "Enter your choice: " choice
	
	case "$choice" in

		1)
			register_student
			;;
		2)
			view_students
			;;
		3)
			search_student
			;;
		4)
			count_students
			;;
		5)
			echo "Thank you for using my system!"
			break
			;;
		
		*)
			echo "Invalid choice my G!"
			;;
		esac
	done 