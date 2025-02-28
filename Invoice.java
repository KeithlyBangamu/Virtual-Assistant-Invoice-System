package invoice;

import java.util.ArrayList;
import java.util.List;

class Invoice {
    private int id;
    private Client client;
    private List<Service> services;
    private double totalAmount;

    public Invoice(int id, Client client, List<Service> services) {
        this.id = id;
        this.client = client;
        this.services = new ArrayList<>(services);
        this.totalAmount = services.stream().mapToDouble(Service::getRate).sum();
    }

    public int getId() { return id; }
    public Client getClient() { return client; }
    public List<Service> getServices() { return services; }
    public double getTotalAmount() { return totalAmount; }

    public String toString() {
        return "Invoice ID: " + id + "\nClient: " + client.getName() + "\nTotal: $" + totalAmount;
    }
}

class InvoiceManager {
    private List<Invoice> invoices = new ArrayList<>();
    private int invoiceIdCounter = 1;

    public void createInvoice(Client client, List<Service> services) {
        invoices.add(new Invoice(invoiceIdCounter++, client, services));
    }

    public void viewInvoices() {
        for (Invoice i : invoices) {
            System.out.println(i);
        }
    }
}
