package invoice;

import java.util.ArrayList;
import java.util.List;

class Service {
    private int id;
    private String name;
    private double rate;

    public Service(int id, String name, double rate) {
        this.id = id;
        this.name = name;
        this.rate = rate;
    }

    public int getId() { return id; }
    public String getName() { return name; }
    public double getRate() { return rate; }

    public void setName(String name) { this.name = name; }
    public void setRate(double rate) { this.rate = rate; }

    public String toString() {
        return "Service ID: " + id + ", Name: " + name + ", Rate: $" + rate + " per hour";
    }
}

class ServiceManager {
    private List<Service> services = new ArrayList<>();
    private int serviceIdCounter = 1;

    public void addService(String name, double rate) {
        services.add(new Service(serviceIdCounter++, name, rate));
    }

    public void viewServices() {
        for (Service s : services) {
            System.out.println(s);
        }
    }

    public void updateService(int id, String name, double rate) {
        for (Service s : services) {
            if (s.getId() == id) {
                s.setName(name);
                s.setRate(rate);
                return;
            }
        }
        System.out.println("Service not found.");
    }

    public void deleteService(int id) {
        services.removeIf(s -> s.getId() == id);
    }

	public Service[] getServices() {

		return null;
	}
}
