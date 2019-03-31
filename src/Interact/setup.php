<?php

    namespace Milestone\SS\Interact;

    use Milestone\Interact\Table;

    class setup implements Table
    {
        public function getModel()
        {
            return \Milestone\SS\Model\Setup::class;
        }

        public function getFillAttributes()
        {
            return ['CODE','DBTYPE','QUANTITY_DECIMAL','RATE_DECIMAL','AMOUNT_DECIMAL','CURRENCY_DECIMAL','QUANTITY_SEPARATOR','RATE_SEPARATOR','AMOUNT_SEPARATOR','CURRENCY_SEPARATOR','DOCDATE_FORMAT','REFDATE_FORMAT','CHQDATE_FORMAT','OTHDATE_FORMAT','CURRENCYDENOMINATION','MULTICOMPANY','MULTIBRANCH','MULTICURRENCY','MULTIPRINT','MULTISTORE','MULTIUNIT','SHIFTMANAGEMENT','BUSINESSKEY','INVACCPOSTING','ITEMCACHE','NEGATIVESTOCK','POQTYUDATE','SOQTYUDATE','PRODUCTION','PRODUCTIONCOSTUPDATION','PRODUCTIONNARRATION','DEFAULTBRANCH','DEFAULTUNIT','TAX','TAX02','TAXREF','ITEMSERIAL','ITEMSERIALTEXT','PAYMENTMODEACTION','BILLPOSTING','AUTOBILLPOSTING','PROFIT','PROFITCALCULATION','CLOSEDUPTO','COSTING','BATCHNO','MFGDATE','EXPDATE','MFGDATE_FORMAT','EXPDATE_FORMAT','LIFETIME','LIFETIMEINTERVAL','PARTCODE','PARTCODETEXT','AREA','AREATEXT','STORAGEBIN','STORAGEBINTEXT','WORKFLOW','LANGUAGE','CULTURE','STOCKJVPOSTING','PROFITJVPOSTING','REPORTTITLE','PRINTLOG','LOADIMAGEONSTARTUP','THEME','SERACHFROMBEGINNING','SEACHAUTOLOCK','REMEMBERLASTSEARCH','DIGITALWALLETTEXT'];
        }

        public function attributeToColumnMapArray()
        {
            return [];
        }

        public function attributeToColumnMethodMapArray()
        {
            return [];
        }

        public function getPrimaryValueFromRowData($data)
        {
            $setup = \Milestone\SS\Model\Setup::where('code',$data['CODE'])->first();
            return $setup ? $setup->id : null;
        }
    }