
BIN_LIB=CMPSYS
LIBLIST=$(BIN_LIB) CLV1
SHELL=/QOpenSys/usr/bin/qsh

all: orders.sqlrpgle orders_h.rpgle

orders.sqlrpgle: orders_h.rpgle

%.sqlrpgle:
	system -s "CHGATR OBJ('/home/CLV/orders/qrpglesrc/$*.sqlrpgle') ATR(*CCSID) VALUE(1252)"
	liblist -a $(LIBLIST);\
	system "CRTSQLRPGI OBJ($(BIN_LIB)/$*) SRCSTMF('/home/CLV/orders/qrpglesrc/$*.sqlrpgle') COMMIT(*NONE) DBGVIEW(*SOURCE) OPTION(*EVENTF) OBJTYPE(*MODULE) RPGPPOPT(*LVL2)"
	system "CRTSRVPGM SRVPGM($(BIN_LIB)/$*) MODULE($(BIN_LIB)/$*) EXPORT(*ALL)"
	system "DLTOBJ OBJ($(BIN_LIB)/$*) OBJTYPE(*MODULE)"

%.rpgle:
	system -s "CHGATR OBJ('/home/CLV/orders/qrpglesrc/$*.rpgle') ATR(*CCSID) VALUE(1252)"