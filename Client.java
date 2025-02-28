package invoice;

import java.util.ArrayList;
import java.util.List;

class Client {
    private int id;
    private String name;
    private String email;

    public Client(int id, String name, String email) {
        this.id = id;
        this.name = name;
        this.email = email;
    }

    public int getId() { return id; }
    public String getName() { return name; }
    public String getEmail() { return email; }

    public void setName(String name) { this.name = name; }
    public void setEmail(String email) { this.email = email; }

    public String toString() {
        return "Client ID: " + id + ", Name: " + name + ", Email: " + email;
    }
}

class ClientManager {
    private List<Client> clients = new ArrayList<>();
    private int clientIdCounter = 1;

    public void addClient(String name, String email) {
        clients.add(new Client(clientIdCounter++, name, email));
    }

    public void viewClients() {
        for (Client c : clients) {
            System.out.println(c);
        }
    }

    public void updateClient(int id, String name, String email) {
        for (Client c : clients) {
            if (c.getId() == id) {
                c.setName(name);
                c.setEmail(email);
                return;
            }
        }
        System.out.println("Client not found.");
    }

    public void deleteClient(int id) {
        clients.removeIf(c -> c.getId() == id);
    }

	public List<Client> getClients() {

		return null;
	}
}
