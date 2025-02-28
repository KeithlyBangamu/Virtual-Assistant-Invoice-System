package invoice;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class InvoiceSystem {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        List<Client> clients = new ArrayList<>();
        List<Service> services = new ArrayList<>();
        List<Invoice> invoices = new ArrayList<>();

        while (true) {
            System.out.println("\n=== Virtual Assistant Invoice System ===");
            System.out.println("1. Client Management");
            System.out.println("2. Service Management");
            System.out.println("3. Invoice Management");
            System.out.println("4. Exit");
            System.out.print("Enter your choice: ");
            int choice = scanner.nextInt();
            scanner.nextLine();

            switch (choice) {
                case 1:
                    System.out.println("1. Add Client\n2. View Clients\n3. Update Client\n4. Delete Client");
                    int clientChoice = scanner.nextInt();
                    scanner.nextLine();
                    if (clientChoice == 1) {
                        System.out.print("Enter name: ");
                        String name = scanner.nextLine();
                        System.out.print("Enter email: ");
                        String email = scanner.nextLine();
                        int id = clients.size() + 1;
                        clients.add(new Client(id, name, email));
                        System.out.println("Client added successfully.");
                    } else if (clientChoice == 2) {
                        if (clients.isEmpty()) {
                            System.out.println("No clients available.");
                        } else {
                            System.out.println("=== Clients ===");
                            for (Client c : clients) {
                                System.out.println(c.getId() + ". " + c.getName() + " - " + c.getEmail());
                            }
                        }
                    } else if (clientChoice == 3) {
                        System.out.print("Enter Client ID to update: ");
                        int id = scanner.nextInt();
                        scanner.nextLine();
                        boolean found = false;
                        for (Client c : clients) {
                            if (c.getId() == id) {
                                System.out.print("Enter new name: ");
                                c.setName(scanner.nextLine());
                                System.out.print("Enter new email: ");
                                c.setEmail(scanner.nextLine());
                                System.out.println("Client updated successfully.");
                                found = true;
                                break;
                            }
                        }
                        if (!found) System.out.println("Client not found.");
                    } else if (clientChoice == 4) {
                        System.out.print("Enter Client ID to delete: ");
                        int id = scanner.nextInt();
                        clients.removeIf(c -> c.getId() == id);
                        System.out.println("Client deleted successfully.");
                    }
                    break;

                case 2:
                    System.out.println("1. Add Service\n2. View Services\n3. Update Service\n4. Delete Service");
                    int serviceChoice = scanner.nextInt();
                    scanner.nextLine();
                    if (serviceChoice == 1) {
                        System.out.print("Enter service name: ");
                        String serviceName = scanner.nextLine();
                        System.out.print("Enter service rate: ");
                        double rate = scanner.nextDouble();
                        int id = services.size() + 1;
                        services.add(new Service(id, serviceName, rate));
                        System.out.println("Service added successfully.");
                    } else if (serviceChoice == 2) {
                        if (services.isEmpty()) {
                            System.out.println("No services available.");
                        } else {
                            System.out.println("=== Services ===");
                            for (Service s : services) {
                                System.out.println(s.getId() + ". " + s.getName() + " - $" + s.getRate());
                            }
                        }
                    } else if (serviceChoice == 3) {
                        System.out.print("Enter Service ID to update: ");
                        int id = scanner.nextInt();
                        scanner.nextLine();
                        boolean found = false;
                        for (Service s : services) {
                            if (s.getId() == id) {
                                System.out.print("Enter new name: ");
                                s.setName(scanner.nextLine());
                                System.out.print("Enter new rate: ");
                                s.setRate(scanner.nextDouble());
                                System.out.println("Service updated successfully.");
                                found = true;
                                break;
                            }
                        }
                        if (!found) System.out.println("Service not found.");
                    } else if (serviceChoice == 4) {
                        System.out.print("Enter Service ID to delete: ");
                        int id = scanner.nextInt();
                        services.removeIf(s -> s.getId() == id);
                        System.out.println("Service deleted successfully.");
                    }
                    break;

                case 3:
                    System.out.println("1. Create Invoice\n2. View Invoices");
                    int invoiceChoice = scanner.nextInt();
                    scanner.nextLine();

                    if (invoiceChoice == 1) {
                      
                        if (clients.isEmpty()) {
                            System.out.println("No clients available. Please add a client first.");
                            break;
                        }

                       
                        if (services.isEmpty()) {
                            System.out.println("No services available. Please add a service first.");
                            break;
                        }
                        
                    
                        System.out.println("Available Clients:");
                        for (Client c : clients) {
                            System.out.println(c.getId() + ". " + c.getName());
                        }
                        System.out.print("Enter Client ID: ");
                        int clientId = scanner.nextInt();
                        scanner.nextLine();

                       
                        Client selectedClient = null;
                        for (Client c : clients) {
                            if (c.getId() == clientId) {
                                selectedClient = c;
                                break;
                            }
                        }

                        if (selectedClient == null) {
                            System.out.println("Invalid client ID. Try again.");
                            break;
                        }

                      
                        List<Service> selectedServices = new ArrayList<>();
                        System.out.println("Available Services:");
                        for (Service s : services) {
                            System.out.println(s.getId() + ". " + s.getName() + " - $" + s.getRate());
                        }
                        System.out.print("Enter Service IDs (comma-separated, e.g., 1,2): ");
                        String serviceInput = scanner.nextLine();
                        String[] serviceIds = serviceInput.split(",");

                        for (String id : serviceIds) {
                            int serviceId = Integer.parseInt(id.trim());
                            for (Service s : services) {
                                if (s.getId() == serviceId) {
                                    selectedServices.add(s);
                                }
                            }
                        }

                        if (selectedServices.isEmpty()) {
                            System.out.println("No valid services selected.");
                            break;
                        }

                       
                        Invoice newInvoice = new Invoice(invoices.size() + 1, selectedClient, selectedServices);
                        invoices.add(newInvoice);
                        System.out.println("Invoice successfully created!");

                    } else if (invoiceChoice == 2) {
                        if (invoices.isEmpty()) {
                            System.out.println("No invoices available.");
                        } else {
                            System.out.println("=== Invoices ===");
                            for (Invoice inv : invoices) {
                                System.out.println(inv);
                            }
                        }
                    }
                    break;

                case 4:
                    System.out.println("Exiting...");
                    scanner.close();
                    System.exit(0);

                default:
                    System.out.println("Invalid choice.");
            }
        }
    }
}
