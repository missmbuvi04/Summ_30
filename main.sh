#!/bin/bash

while true; do
    echo "1. Create student record"
    echo "2. View all students"
    echo "3. Delete student by ID"
    echo "4. Update student record by ID"
    echo "5. Exit"
    read choice

    case $choice in
        1)
            echo "Enter student email:"
            read email
            echo "Enter student age:"
            read age
            echo "Enter student ID:"
            read student_id

            echo "$email, $age, $student_id" >> students-list_1023.txt
            ;;
        2)
            cat students-list_1023.txt
            ;;
        3)
            echo "Enter student ID to delete:"
            read delete_id
	    sed -i "0,/^.*$delete_id\$/s///" students-list_1023.txt

           
	    ;;
        4)
            echo "Enter student ID to update:"
            read update_id
            if grep -q -E $update_id students-list_1023.txt; then 
                echo 'Enter the old value to be updated'
                read old_value
                echo 'Enter the new value'
                read new_value
                sed -i "/$update_id/s/$old_value/$new_value/" students-list_1023.txt
            else
                echo 'student id not found!!!'
            fi
            ;;
       5)
            exit
            ;;
        *)
            echo "Invalid option. Please choose again."
            ;;
    esac
done
