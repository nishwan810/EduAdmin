

        function updateDateTime() {
            const dateElement = document.getElementById("currentDateTime");
            const now = new Date();
            const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
            const formattedDate = now.toLocaleDateString("en-US", options);
            const formattedTime = now.toLocaleTimeString("en-US");
            dateElement.textContent = `${formattedDate} - ${formattedTime}`;
        }

        setInterval(updateDateTime, 1000);
        updateDateTime();

       
    // Load tasks from local storage
    function loadTasks() {
        let tasks = JSON.parse(localStorage.getItem("todoTasks")) || [];
        let todoList = document.getElementById("todoList");
        todoList.innerHTML = ""; // Clear list
        tasks.forEach(task => {
            addTaskToDOM(task);
        });
    }

    // Function to add a task
    function addTask() {
        let taskInput = document.getElementById("todoInput");
        let taskText = taskInput.value.trim();
        if (taskText === "") return;

        addTaskToDOM(taskText);
        saveTask(taskText);
        taskInput.value = "";
    }

    // Function to add task to the DOM
    function addTaskToDOM(taskText) {
        let listItem = document.createElement("li");
        listItem.className = "list-group-item d-flex justify-content-between align-items-center";
        listItem.innerHTML = `${taskText} <button class="btn btn-danger btn-sm" onclick="removeTask(this, '${taskText}')">X</button>`;

        document.getElementById("todoList").appendChild(listItem);
		
		
    }

    // Function to save tasks to local storage
    function saveTask(taskText) {
        let tasks = JSON.parse(localStorage.getItem("todoTasks")) || [];
        tasks.push(taskText);
        localStorage.setItem("todoTasks", JSON.stringify(tasks));
    }

    // Function to remove a task
    function removeTask(button, taskText) {
        let tasks = JSON.parse(localStorage.getItem("todoTasks")) || [];
        tasks = tasks.filter(task => task !== taskText); // Remove task
        localStorage.setItem("todoTasks", JSON.stringify(tasks));
        button.parentElement.remove();
    }

    loadTasks();

    document.addEventListener("DOMContentLoaded", function () {
    updateDateTime();
    setInterval(updateDateTime, 1000);
    loadTasks();
});


function resetForm() {
        document.getElementById("courseForm").reset();
    }

   // document.getElementById("resetBtn").addEventListener("click", function() {
    //document.getElementById("courseForm").reset();
//});//
