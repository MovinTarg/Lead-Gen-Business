SELECT SUM(billing.amount) FROM billing
WHERE billing.charged_datetime LIKE '%2012-03%';

SELECT SUM(billing.amount) FROM billing
JOIN clients ON billing.client_id = clients.client_id
WHERE clients.client_id = 2;

SELECT sites.domain_name FROM sites
JOIN clients ON sites.client_id = clients.client_id
WHERE clients.client_id = 10;

SELECT clients.client_id, COUNT(sites.domain_name), MONTH(sites.created_datetime), YEAR(sites.created_datetime) FROM sites
JOIN clients ON sites.client_id = clients.client_id
WHERE clients.client_id IN (1, 20)
GROUP BY MONTH(sites.created_datetime), YEAR(sites.created_datetime)
ORDER BY clients.client_id, YEAR(sites.created_datetime);

SELECT COUNT(leads.leads_id), sites.domain_name FROM leads
JOIN sites ON leads.site_id = sites.site_id
WHERE leads.registered_datetime BETWEEN DATE('2011-01-01') AND DATE('2011-02-15')
GROUP BY sites.domain_name;

SELECT clients.first_name, clients.last_name, Count(leads.leads_id) FROM clients
JOIN sites ON clients.client_id = sites.client_id
JOIN leads ON sites.site_id = leads.site_id
WHERE leads.registered_datetime LIKE '%2011%'
GROUP BY clients.client_id;

SELECT clients.first_name, clients.last_name, Count(leads.leads_id) FROM clients
JOIN sites ON clients.client_id = sites.client_id
JOIN leads ON sites.site_id = leads.site_id
WHERE leads.registered_datetime BETWEEN DATE('2011-01-01') AND DATE('2011-06-30')
GROUP BY clients.client_id;

SELECT clients.first_name, clients.last_name, sites.domain_name, COUNT(leads.leads_id) FROM clients
JOIN sites ON clients.client_id = sites.client_id
JOIN leads ON sites.site_id = leads.site_id
WHERE leads.registered_datetime LIKE '%2011%'
GROUP BY sites.domain_name
ORDER BY clients.client_id;

SELECT clients.first_name, clients.last_name, sites.domain_name, COUNT(leads.leads_id) FROM clients
JOIN sites ON clients.client_id = sites.client_id
JOIN leads ON sites.site_id = leads.site_id
GROUP BY sites.domain_name
ORDER BY clients.client_id;

SELECT clients.client_id, MONTH(billing.charged_datetime), YEAR(billing.charged_datetime), SUM(billing.amount) FROM billing
JOIN clients ON billing.client_id = clients.client_id
GROUP BY MONTH(billing.charged_datetime), YEAR(billing.charged_datetime)
ORDER BY clients.client_id, YEAR(billing.charged_datetime), MONTH(billing.charged_datetime);

SELECT clients.first_name, clients.last_name, GROUP_CONCAT(sites.domain_name,' / ') FROM clients
JOIN sites ON clients.client_id = sites.client_id
GROUP BY clients.client_id
ORDER BY clients.client_id;