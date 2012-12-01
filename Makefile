TABLE_NAME = Lys

SCIM_TABLES_DIR = /usr/share/scim/tables
SCIM_ICONS_DIR  = /usr/share/scim/icons

SRC_DIR  = ./src
BIN_DIR  = ./bin
ICON_DIR = ./icons

SCIM_MAKE_TABLE = scim-make-table

compile: $(BIN_DIR)/$(TABLE_NAME).bin

install: compile
	cp $(BIN_DIR)/$(TABLE_NAME).bin $(SCIM_TABLES_DIR)
	cp $(ICON_DIR)/$(TABLE_NAME).png $(SCIM_ICONS_DIR)

uninstall: 
	rm $(SCIM_TABLES_DIR)/$(TABLE_NAME).bin
	rm $(SCIM_ICONS_DIR)/$(TABLE_NAME).png

clean: 
	rm -f $(BIN_DIR)/*

$(BIN_DIR)/$(TABLE_NAME).bin: $(SRC_DIR)/$(TABLE_NAME).txt.in
	sed 's,@SCIM_ICONDIR@,$(SCIM_ICONS_DIR),g' < $(SRC_DIR)/$(TABLE_NAME).txt.in | sed 's,@TABLE_NAME@,$(TABLE_NAME),g' > $(BIN_DIR)/$(TABLE_NAME).txt
	$(SCIM_MAKE_TABLE) $(BIN_DIR)/$(TABLE_NAME).txt -b -o $(BIN_DIR)/$(TABLE_NAME).bin

