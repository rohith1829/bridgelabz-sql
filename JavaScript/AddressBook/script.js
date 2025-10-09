const API_URL = 'http://localhost:3000/people';

const addressTableBody = document.querySelector('#addressTable tbody');
const addPersonBtn = document.getElementById('addPersonBtn');


async function fetchPeople() {
    try {
        const response = await fetch(API_URL);
        if (!response.ok) throw new Error('Failed to fetch data');
        return await response.json();
    } catch (error) {
        console.error("Error fetching people:", error);
        addressTableBody.innerHTML = '<tr><td colspan="7">Error loading data. Is JSON Server running?</td></tr>';
        return [];
    }
}


function renderTable(people) {
    addressTableBody.innerHTML = ''; 
    people.forEach(person => {
        const row = addressTableBody.insertRow();
        row.dataset.id = person.id; 

        row.insertCell().textContent = person.fullName;
        row.insertCell().textContent = person.address;
        row.insertCell().textContent = person.city;
        row.insertCell().textContent = person.state;
        row.insertCell().textContent = person.zipCode;
        row.insertCell().textContent = person.phoneNumber;
        
             const actionCell = row.insertCell();
        actionCell.className = 'action-buttons';
     
        actionCell.innerHTML = `
            <button class="delete-btn" data-id="${person.id}"><i class="fas fa-trash"></i></button>
            <button class="edit-btn" data-id="${person.id}"><i class="fas fa-pencil-alt"></i></button>
        `;
    });
}

async function handleDelete(id) {
    if (!confirm('Are you sure you want to delete this entry?')) return;
    
    try {
        const response = await fetch(`${API_URL}/${id}`, {
            method: 'DELETE'
        });
        
        if (!response.ok) throw new Error('Failed to delete');
        
        const rowToRemove = addressTableBody.querySelector(`[data-id="${id}"]`);
        if (rowToRemove) {
            rowToRemove.remove();
        }
    } catch (error) {
        console.error('Deletion failed:', error);
        alert('Failed to delete person. Check console and JSON Server.');
    }
}


addPersonBtn.addEventListener('click', () => {
    window.location.href = 'add_person.html';
});

function handleEdit(id) {
    window.location.href = `edit_person.html?id=${id}`;
}


addressTableBody.addEventListener('click', (event) => {
    const target = event.target.closest('button');
    if (!target) return;
    
    const id = target.dataset.id;
    if (!id) return;
    
    if (target.classList.contains('delete-btn')) {
        handleDelete(id);
    } else if (target.classList.contains('edit-btn')) {
        handleEdit(id); 
    }
});



async function loadData() {
    const people = await fetchPeople();
    renderTable(people);
}

loadData();