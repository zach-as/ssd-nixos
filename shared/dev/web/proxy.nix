{ ... }:

{
  services.nginx = {
    enable = true;
    virtualHosts."crm.sturtzsolutions.com" = {
      addSSL = true;
      enableACME = true;
      root = "/var/www/crm";
    };
  };
  security.acme = {
    acceptTerms = true;
    defaults.email = "zach.andersturtz@sturtzsolutions.com";
  };
}
