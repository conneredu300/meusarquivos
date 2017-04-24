#!/bin/sh

resposta="n"
consulta=""
parametro=""

clear
rm *.jrxml
usuario=$(whoami)

echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<jasperReport xmlns=\"http://jasperreports.sourceforge.net/jasperreports\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:schemaLocation=\"http://jasperreports.sourceforge.net/jasperreports http://jasperreports.sourceforge.net/xsd/jasperreport.xsd\" name=\"dependencia-adaptacao\" language=\"groovy\" pageWidth=\"842\" pageHeight=\"595\" orientation=\"Landscape\" whenNoDataType=\"AllSectionsNoDetail\" columnWidth=\"758\" leftMargin=\"56\" rightMargin=\"28\" topMargin=\"56\" bottomMargin=\"28\" uuid=\"38c3e50a-ad22-48ba-8a26-f64313253e7a\">
	<property name=\"ireport.zoom\" value=\"1.0\"/>
	<property name=\"ireport.x\" value=\"0\"/>
	<property name=\"ireport.y\" value=\"0\"/>
	<style name=\"style1\">
		<conditionalStyle>
			<conditionExpression><![CDATA[\$V{REPORT_COUNT}%2!=0]]></conditionExpression>
			<style forecolor=\"#C0C0C0\" backcolor=\"#C0C0C0\"/>
		</conditionalStyle>
	</style>
	<parameter name=\"logo\" class=\"java.lang.String\">
		<defaultValueExpression><![CDATA[\"http://fadivale.versatecnologia.com.br/portal/wp-content/uploads/2014/10/logo-b.png\"]]></defaultValueExpression>
	</parameter>
	<parameter name=\"mantenedora\" class=\"java.lang.String\">
		<defaultValueExpression><![CDATA[\"SOCIEDADE SIMPLES CULTURA E EDUCAÇÃO\"]]></defaultValueExpression>
	</parameter>
	<parameter name=\"instituicao\" class=\"java.lang.String\">
		<defaultValueExpression><![CDATA[\"Faculdade de Direito do Vale do Rio Doce\"]]></defaultValueExpression>
	</parameter>
	<parameter name=\"instituicaoinfo\" class=\"java.lang.String\"/>
	<parameter name=\"titulo\" class=\"java.lang.String\"/>
	<parameter name=\"relatorioinfo\" class=\"java.lang.String\"/>
	<parameter name=\"endereco\" class=\"java.lang.String\">
		<parameterDescription><![CDATA[]]></parameterDescription>
		<defaultValueExpression><![CDATA[\"R. Dom Pedro II, 244 - Centro, Gov. Valadares - MG, 35010-090\"]]></defaultValueExpression>
	</parameter>
	<parameter name=\"sistema\" class=\"java.lang.String\">
		<defaultValueExpression><![CDATA[\"Universa\"]]></defaultValueExpression>
	</parameter>" >> "./relatorio.jrxml"

while [ "$resposta" != "e" ]
do
        clear
        echo "Parametro: "
        read parametro
        echo "insira a condição para o parametro" $parametro
        read consulta
        echo "where $consulta $parametro\nCorrigir [c]\tMais Parametros [m]\tEncerrar [e]: "
        read resposta
case $resposta in
	"c")
		 ((parametro=0))
		 ((consulta=0))
	;;
        "m")
	         			echo "            <parameter name=\""$parametro"\" class=\"java.lang.String\">
                        <defaultValueExpression>
                                <![CDATA[null]]>
                        </defaultValueExpression>
                  </parameter>" >> "./relatorio.jrxml";
                                        echo "                  <parameter name=\""$parametro"sql\" class=\"java.lang.String\">
                        <defaultValueExpression>
                                <![CDATA[\$P{"$parametro"} == null?\"1 = 1\":\""$consulta" (\"+\$P{"$parametro"}+\")\"]]>
                        </defaultValueExpression>
                  </parameter>" >> "./relatorio.jrxml";
	         ((parametro=0))
                 ((consulta=0))
 	;;
	*) ;;
esac
done


echo "<queryString>
		</queryString>
		<group name=\"total_pagina\">
			<groupExpression><![CDATA[\$V{PAGE_NUMBER}]]></groupExpression>
		</group>
		<background>
			<band splitType=\"Stretch\"/>
		</background>
		<pageHeader>
			<band height=\"108\">
				<rectangle>
					<reportElement stretchType=\"RelativeToBandHeight\" x=\"-1\" y=\"87\" width=\"756\" height=\"20\" forecolor=\"#FEFEFE\" uuid=\"e5baa959-3a33-4d4e-9322-f7413e31027d\"/>
				</rectangle>
				<rectangle>
					<reportElement x=\"185\" y=\"0\" width=\"572\" height=\"56\" uuid=\"4f3790d6-3b54-4027-b8e9-c293d105b56a\"/>
				</rectangle>
				<rectangle>
					<reportElement x=\"185\" y=\"56\" width=\"572\" height=\"30\" uuid=\"e7a4a0fa-28de-41a0-a658-ca3b54d65965\"/>
				</rectangle>
				<image hAlign=\"Center\" vAlign=\"Middle\" onErrorType=\"Icon\">
					<reportElement x=\"0\" y=\"0\" width=\"185\" height=\"86\" uuid=\"8d9feb5a-2d0e-4ee5-9e67-f3970f61938d\"/>
					<box topPadding=\"0\" leftPadding=\"2\" bottomPadding=\"2\" rightPadding=\"2\">
						<pen lineWidth=\"1.0\"/>
						<topPen lineWidth=\"1.0\"/>
						<leftPen lineWidth=\"1.0\"/>
						<bottomPen lineWidth=\"1.0\"/>
						<rightPen lineWidth=\"1.0\"/>
					</box>
					<imageExpression><![CDATA[\$P{logo}]]></imageExpression>
				</image>
				<textField>
					<reportElement x=\"185\" y=\"0\" width=\"573\" height=\"20\" uuid=\"e8a2a509-9a46-41b3-a634-6b41175cd4bb\"/>
					<box>
						<rightPen lineWidth=\"1.0\"/>
					</box>
					<textElement textAlignment=\"Center\" verticalAlignment=\"Middle\">
						<font size=\"16\" isBold=\"true\"/>
					</textElement>
					<textFieldExpression><![CDATA[\$P{mantenedora}]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x=\"185\" y=\"20\" width=\"573\" height=\"18\" uuid=\"18e346b2-064d-4437-8463-7cdda39b8944\"/>
					<box>
						<rightPen lineWidth=\"1.0\"/>
					</box>
					<textElement textAlignment=\"Center\" verticalAlignment=\"Middle\">
						<font size=\"14\" isBold=\"true\"/>
					</textElement>
					<textFieldExpression><![CDATA[\$P{instituicao}]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x=\"185\" y=\"38\" width=\"573\" height=\"18\" uuid=\"bf94bdec-c21b-43f4-91aa-350b05d12a70\"/>
					<box>
						<rightPen lineWidth=\"1.0\"/>
					</box>
					<textElement textAlignment=\"Center\" verticalAlignment=\"Middle\">
						<font size=\"12\" isBold=\"true\"/>
					</textElement>
					<textFieldExpression><![CDATA[\$P{instituicaoinfo}?\$P{instituicaoinfo}:' ']]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x=\"185\" y=\"56\" width=\"573\" height=\"30\" uuid=\"a69155ce-1041-4fad-bca5-630fa44d5e44\"/>
					<box>
						<rightPen lineWidth=\"1.0\"/>
					</box>
					<textElement textAlignment=\"Center\" verticalAlignment=\"Middle\">
						<font size=\"18\" isBold=\"false\"/>
					</textElement>
					<textFieldExpression><![CDATA[\$P{titulo}]]></textFieldExpression>
				</textField>
				<textField isStretchWithOverflow=\"true\">
					<reportElement stretchType=\"RelativeToTallestObject\" x=\"0\" y=\"87\" width=\"758\" height=\"20\" uuid=\"5fb8b59c-7118-435d-9541-9d0574ed5525\"/>
					<box topPadding=\"1\" leftPadding=\"1\" bottomPadding=\"1\" rightPadding=\"1\">
						<pen lineWidth=\"1.0\"/>
						<topPen lineWidth=\"1.0\"/>
						<leftPen lineWidth=\"1.0\"/>
						<bottomPen lineWidth=\"1.0\"/>
						<rightPen lineWidth=\"1.0\"/>
					</box>
					<textElement textAlignment=\"Center\" verticalAlignment=\"Middle\">
						<font size=\"10\" isBold=\"true\"/>
					</textElement>
					<textFieldExpression><![CDATA[\$P{relatorioinfo}?\$P{relatorioinfo}:' ']]></textFieldExpression>
				</textField>
			</band>
		</pageHeader>
		<columnHeader>
			<band height=\"50\" splitType=\"Stretch\">
				<staticText>
					<reportElement mode=\"Opaque\" x=\"0\" y=\"18\" width=\"124\" height=\"21\" forecolor=\"#FEFEFE\" backcolor=\"#363636\" uuid=\"37574783-ec51-4d48-b8ef-f1043c39ee59\"/>
					<box leftPadding=\"4\">
						<pen lineWidth=\"1.0\" lineColor=\"#0A0000\"/>
						<topPen lineWidth=\"1.0\" lineColor=\"#0A0000\"/>
						<leftPen lineWidth=\"1.0\" lineColor=\"#0A0000\"/>
						<bottomPen lineWidth=\"1.0\" lineColor=\"#0A0000\"/>
						<rightPen lineWidth=\"1.0\" lineColor=\"#0A0000\"/>
					</box>
					<textElement textAlignment=\"Left\" verticalAlignment=\"Middle\">
						<font fontName=\"Verdana\" size=\"12\" isBold=\"true\" isPdfEmbedded=\"true\"/>
					</textElement>
					<text><![CDATA[Exemplo]]></text>
				</staticText>
				<staticText>
					<reportElement mode=\"Opaque\" x=\"226\" y=\"18\" width=\"65\" height=\"21\" forecolor=\"#FEFEFE\" backcolor=\"#363636\" uuid=\"a2d69585-0bf4-4c98-842a-d8edc95babd9\"/>
					<box leftPadding=\"4\">
						<pen lineWidth=\"1.0\" lineColor=\"#0A0000\"/>
						<topPen lineWidth=\"1.0\" lineColor=\"#0A0000\"/>
						<leftPen lineWidth=\"1.0\" lineColor=\"#0A0000\"/>
						<bottomPen lineWidth=\"1.0\" lineColor=\"#0A0000\"/>
						<rightPen lineWidth=\"1.0\" lineColor=\"#0A0000\"/>
					</box>
					<textElement textAlignment=\"Left\" verticalAlignment=\"Middle\">
						<font fontName=\"Verdana\" size=\"10\" isBold=\"true\" isPdfEmbedded=\"true\"/>
					</textElement>
					<text><![CDATA[Exemplo]]></text>
				</staticText>
				<staticText>
					<reportElement mode=\"Opaque\" x=\"291\" y=\"18\" width=\"65\" height=\"21\" forecolor=\"#FEFEFE\" backcolor=\"#363636\" uuid=\"8c357bdb-52e9-4769-a15e-184c6af99d2c\"/>
					<box leftPadding=\"4\">
						<pen lineWidth=\"1.0\" lineColor=\"#0A0000\"/>
						<topPen lineWidth=\"1.0\" lineColor=\"#0A0000\"/>
						<leftPen lineWidth=\"1.0\" lineColor=\"#0A0000\"/>
						<bottomPen lineWidth=\"1.0\" lineColor=\"#0A0000\"/>
						<rightPen lineWidth=\"1.0\" lineColor=\"#0A0000\"/>
					</box>
					<textElement textAlignment=\"Left\" verticalAlignment=\"Middle\">
						<font fontName=\"Verdana\" size=\"10\" isBold=\"true\" isPdfEmbedded=\"true\"/>
					</textElement>
					<text><![CDATA[Exemplo]]></text>
				</staticText>
				<staticText>
					<reportElement mode=\"Opaque\" x=\"356\" y=\"18\" width=\"65\" height=\"21\" forecolor=\"#FEFEFE\" backcolor=\"#363636\" uuid=\"54bf0288-954d-4bdd-926c-3bd375499bb5\"/>
					<box leftPadding=\"4\">
						<pen lineWidth=\"1.0\" lineColor=\"#0A0000\"/>
						<topPen lineWidth=\"1.0\" lineColor=\"#0A0000\"/>
						<leftPen lineWidth=\"1.0\" lineColor=\"#0A0000\"/>
						<bottomPen lineWidth=\"1.0\" lineColor=\"#0A0000\"/>
						<rightPen lineWidth=\"1.0\" lineColor=\"#0A0000\"/>
					</box>
					<textElement textAlignment=\"Left\" verticalAlignment=\"Middle\">
						<font fontName=\"Verdana\" size=\"10\" isBold=\"true\" isPdfEmbedded=\"true\"/>
					</textElement>
					<text><![CDATA[Exemplo]]></text>
				</staticText>
				<staticText>
					<reportElement mode=\"Opaque\" x=\"421\" y=\"18\" width=\"65\" height=\"21\" forecolor=\"#FEFEFE\" backcolor=\"#363636\" uuid=\"cca0eb89-51e4-4f68-88ad-9b60e8149d35\"/>
					<box leftPadding=\"4\">
						<pen lineWidth=\"1.0\" lineColor=\"#0A0000\"/>
						<topPen lineWidth=\"1.0\" lineColor=\"#0A0000\"/>
						<leftPen lineWidth=\"1.0\" lineColor=\"#0A0000\"/>
						<bottomPen lineWidth=\"1.0\" lineColor=\"#0A0000\"/>
						<rightPen lineWidth=\"1.0\" lineColor=\"#0A0000\"/>
					</box>
					<textElement textAlignment=\"Left\" verticalAlignment=\"Middle\">
						<font fontName=\"Verdana\" size=\"10\" isBold=\"true\" isPdfEmbedded=\"true\"/>
					</textElement>
					<text><![CDATA[Exemplo]]></text>
				</staticText>
				<staticText>
					<reportElement mode=\"Opaque\" x=\"124\" y=\"18\" width=\"101\" height=\"21\" forecolor=\"#FEFEFE\" backcolor=\"#363636\" uuid=\"491cf006-eb32-4bb2-82fd-9f40aac43c60\"/>
					<box leftPadding=\"4\">
						<pen lineWidth=\"1.0\" lineColor=\"#0A0000\"/>
						<topPen lineWidth=\"1.0\" lineColor=\"#0A0000\"/>
						<leftPen lineWidth=\"1.0\" lineColor=\"#0A0000\"/>
						<bottomPen lineWidth=\"1.0\" lineColor=\"#0A0000\"/>
						<rightPen lineWidth=\"1.0\" lineColor=\"#0A0000\"/>
					</box>
					<textElement textAlignment=\"Left\" verticalAlignment=\"Middle\">
						<font fontName=\"Verdana\" size=\"12\" isBold=\"true\" isPdfEmbedded=\"true\"/>
					</textElement>
					<text><![CDATA[Exemplo]]></text>
				</staticText>
				<staticText>
					<reportElement mode=\"Opaque\" x=\"487\" y=\"18\" width=\"65\" height=\"21\" forecolor=\"#FEFEFE\" backcolor=\"#363636\" uuid=\"6fa24f32-07e8-46e3-881c-47534f42c014\"/>
					<box leftPadding=\"4\">
						<pen lineWidth=\"1.0\" lineColor=\"#0A0000\"/>
						<topPen lineWidth=\"1.0\" lineColor=\"#0A0000\"/>
						<leftPen lineWidth=\"1.0\" lineColor=\"#0A0000\"/>
						<bottomPen lineWidth=\"1.0\" lineColor=\"#0A0000\"/>
						<rightPen lineWidth=\"1.0\" lineColor=\"#0A0000\"/>
					</box>
					<textElement textAlignment=\"Left\" verticalAlignment=\"Middle\">
						<font fontName=\"Verdana\" size=\"10\" isBold=\"true\" isPdfEmbedded=\"true\"/>
					</textElement>
					<text><![CDATA[Exemplo]]></text>
				</staticText>
				<staticText>
					<reportElement mode=\"Opaque\" x=\"553\" y=\"18\" width=\"65\" height=\"21\" forecolor=\"#FEFEFE\" backcolor=\"#363636\" uuid=\"44533416-6ea1-406e-8e39-98d425369f36\"/>
					<box leftPadding=\"4\">
						<pen lineWidth=\"1.0\" lineColor=\"#0A0000\"/>
						<topPen lineWidth=\"1.0\" lineColor=\"#0A0000\"/>
						<leftPen lineWidth=\"1.0\" lineColor=\"#0A0000\"/>
						<bottomPen lineWidth=\"1.0\" lineColor=\"#0A0000\"/>
						<rightPen lineWidth=\"1.0\" lineColor=\"#0A0000\"/>
					</box>
					<textElement textAlignment=\"Left\" verticalAlignment=\"Middle\">
						<font fontName=\"Verdana\" size=\"10\" isBold=\"true\" isPdfEmbedded=\"true\"/>
					</textElement>
					<text><![CDATA[Exemplo]]></text>
				</staticText>
				<staticText>
					<reportElement mode=\"Opaque\" x=\"618\" y=\"18\" width=\"62\" height=\"21\" forecolor=\"#FEFEFE\" backcolor=\"#363636\" uuid=\"9b89d871-2bc2-443b-a79e-731677f841b1\"/>
					<box leftPadding=\"4\">
						<pen lineWidth=\"1.0\" lineColor=\"#0A0000\"/>
						<topPen lineWidth=\"1.0\" lineColor=\"#0A0000\"/>
						<leftPen lineWidth=\"1.0\" lineColor=\"#0A0000\"/>
						<bottomPen lineWidth=\"1.0\" lineColor=\"#0A0000\"/>
						<rightPen lineWidth=\"1.0\" lineColor=\"#0A0000\"/>
					</box>
					<textElement textAlignment=\"Left\" verticalAlignment=\"Middle\">
						<font fontName=\"Verdana\" size=\"8\" isBold=\"true\" isPdfEmbedded=\"true\"/>
					</textElement>
					<text><![CDATA[Exemplo]]></text>
				</staticText>
				<staticText>
					<reportElement mode=\"Opaque\" x=\"678\" y=\"18\" width=\"77\" height=\"21\" forecolor=\"#FEFEFE\" backcolor=\"#363636\" uuid=\"38b68e4b-54be-4c07-bec8-12144f2405f4\"/>
					<box leftPadding=\"4\">
						<pen lineWidth=\"1.0\" lineColor=\"#0A0000\"/>
						<topPen lineWidth=\"1.0\" lineColor=\"#0A0000\"/>
						<leftPen lineWidth=\"1.0\" lineColor=\"#0A0000\"/>
						<bottomPen lineWidth=\"1.0\" lineColor=\"#0A0000\"/>
						<rightPen lineWidth=\"1.0\" lineColor=\"#0A0000\"/>
					</box>
					<textElement textAlignment=\"Left\" verticalAlignment=\"Middle\">
						<font fontName=\"Verdana\" size=\"8\" isBold=\"true\" isPdfEmbedded=\"true\"/>
					</textElement>
					<text><![CDATA[Exemplo]]></text>
				</staticText>
			</band>
		</columnHeader>
		<detail>
			<band height=\"27\" splitType=\"Prevent\">
				<rectangle>
					<reportElement style=\"style1\" stretchType=\"RelativeToTallestObject\" x=\"-1\" y=\"0\" width=\"757\" height=\"27\" forecolor=\"#FEFEFE\" uuid=\"77f4a295-79ee-466b-8d84-c747bf8a7005\"/>
				</rectangle>
				<textField isStretchWithOverflow=\"true\">
					<reportElement stretchType=\"RelativeToTallestObject\" mode=\"Transparent\" x=\"0\" y=\"0\" width=\"124\" height=\"27\" uuid=\"3e5f59c7-4fe3-4c0c-8fcf-b75b7d82c1d6\"/>
					<box topPadding=\"1\" leftPadding=\"4\" bottomPadding=\"1\" rightPadding=\"1\">
						<pen lineWidth=\"1.0\"/>
						<topPen lineWidth=\"1.0\"/>
						<leftPen lineWidth=\"1.0\"/>
						<bottomPen lineWidth=\"1.0\"/>
						<rightPen lineWidth=\"1.0\"/>
					</box>
					<textElement textAlignment=\"Left\" verticalAlignment=\"Middle\"/>
					<textFieldExpression><![CDATA[\$F{exemplo}]]></textFieldExpression>
				</textField>
				<textField isStretchWithOverflow=\"true\">
					<reportElement stretchType=\"RelativeToTallestObject\" mode=\"Transparent\" x=\"225\" y=\"0\" width=\"65\" height=\"27\" uuid=\"70fab4db-d004-4804-afd7-20e8b012e585\"/>
					<box topPadding=\"1\" leftPadding=\"4\" bottomPadding=\"1\" rightPadding=\"1\">
						<pen lineWidth=\"1.0\"/>
						<topPen lineWidth=\"1.0\"/>
						<leftPen lineWidth=\"1.0\"/>
						<bottomPen lineWidth=\"1.0\"/>
						<rightPen lineWidth=\"1.0\"/>
					</box>
					<textElement textAlignment=\"Left\" verticalAlignment=\"Middle\"/>
					<textFieldExpression><![CDATA[\$F{exemplo}]]></textFieldExpression>
				</textField>
				<textField isStretchWithOverflow=\"true\">
					<reportElement stretchType=\"RelativeToTallestObject\" mode=\"Transparent\" x=\"290\" y=\"0\" width=\"65\" height=\"27\" uuid=\"f0e9bd67-0c3a-4b15-b9de-6d0f29a12a98\"/>
					<box topPadding=\"1\" leftPadding=\"4\" bottomPadding=\"1\" rightPadding=\"1\">
						<pen lineWidth=\"1.0\"/>
						<topPen lineWidth=\"1.0\"/>
						<leftPen lineWidth=\"1.0\"/>
						<bottomPen lineWidth=\"1.0\"/>
						<rightPen lineWidth=\"1.0\"/>
					</box>
					<textElement textAlignment=\"Left\" verticalAlignment=\"Middle\"/>
					<textFieldExpression><![CDATA[\$F{exemplo}]]></textFieldExpression>
				</textField>
				<textField isStretchWithOverflow=\"true\">
					<reportElement stretchType=\"RelativeToTallestObject\" mode=\"Transparent\" x=\"356\" y=\"0\" width=\"65\" height=\"27\" uuid=\"a932b8bf-1565-4939-bdf9-b60b0129b89f\"/>
					<box topPadding=\"1\" leftPadding=\"4\" bottomPadding=\"1\" rightPadding=\"1\">
						<pen lineWidth=\"1.0\"/>
						<topPen lineWidth=\"1.0\"/>
						<leftPen lineWidth=\"1.0\"/>
						<bottomPen lineWidth=\"1.0\"/>
						<rightPen lineWidth=\"1.0\"/>
					</box>
					<textElement textAlignment=\"Left\" verticalAlignment=\"Middle\"/>
					<textFieldExpression><![CDATA[\$F{exemplo}]]></textFieldExpression>
				</textField>
				<textField isStretchWithOverflow=\"true\">
					<reportElement stretchType=\"RelativeToTallestObject\" mode=\"Transparent\" x=\"422\" y=\"0\" width=\"65\" height=\"27\" uuid=\"ce9f2196-a69f-4edf-9481-1a7bbab770e9\"/>
					<box topPadding=\"1\" leftPadding=\"4\" bottomPadding=\"1\" rightPadding=\"1\">
						<pen lineWidth=\"1.0\"/>
						<topPen lineWidth=\"1.0\"/>
						<leftPen lineWidth=\"1.0\"/>
						<bottomPen lineWidth=\"1.0\"/>
						<rightPen lineWidth=\"1.0\"/>
					</box>
					<textElement textAlignment=\"Left\" verticalAlignment=\"Middle\"/>
					<textFieldExpression><![CDATA[\$F{exemplo}]]></textFieldExpression>
				</textField>
				<textField isStretchWithOverflow=\"true\">
					<reportElement stretchType=\"RelativeToTallestObject\" mode=\"Transparent\" x=\"125\" y=\"0\" width=\"100\" height=\"27\" uuid=\"3093e3b8-68aa-40df-bd68-9ded7d6da625\"/>
					<box topPadding=\"1\" leftPadding=\"4\" bottomPadding=\"1\" rightPadding=\"1\">
						<pen lineWidth=\"1.0\"/>
						<topPen lineWidth=\"1.0\"/>
						<leftPen lineWidth=\"1.0\"/>
						<bottomPen lineWidth=\"1.0\"/>
						<rightPen lineWidth=\"1.0\"/>
					</box>
					<textElement textAlignment=\"Left\" verticalAlignment=\"Middle\"/>
					<textFieldExpression><![CDATA[\$F{exemplo}]]></textFieldExpression>
				</textField>
				<textField isStretchWithOverflow=\"true\">
					<reportElement stretchType=\"RelativeToTallestObject\" mode=\"Transparent\" x=\"488\" y=\"0\" width=\"65\" height=\"27\" uuid=\"b4fea377-a96f-4f7d-8df4-f91df0fbd472\"/>
					<box topPadding=\"1\" leftPadding=\"4\" bottomPadding=\"1\" rightPadding=\"1\">
						<pen lineWidth=\"1.0\"/>
						<topPen lineWidth=\"1.0\"/>
						<leftPen lineWidth=\"1.0\"/>
						<bottomPen lineWidth=\"1.0\"/>
						<rightPen lineWidth=\"1.0\"/>
					</box>
					<textElement textAlignment=\"Left\" verticalAlignment=\"Middle\"/>
					<textFieldExpression><![CDATA[\$F{exemplo}]]></textFieldExpression>
				</textField>
				<textField isStretchWithOverflow=\"true\">
					<reportElement stretchType=\"RelativeToTallestObject\" mode=\"Transparent\" x=\"553\" y=\"0\" width=\"65\" height=\"27\" uuid=\"cd00e3e5-d5e7-43fb-82a5-6209347f68e7\"/>
					<box topPadding=\"1\" leftPadding=\"4\" bottomPadding=\"1\" rightPadding=\"1\">
						<pen lineWidth=\"1.0\"/>
						<topPen lineWidth=\"1.0\"/>
						<leftPen lineWidth=\"1.0\"/>
						<bottomPen lineWidth=\"1.0\"/>
						<rightPen lineWidth=\"1.0\"/>
					</box>
					<textElement textAlignment=\"Left\" verticalAlignment=\"Middle\"/>
					<textFieldExpression><![CDATA[\$F{exemplo}]]></textFieldExpression>
				</textField>
				<textField isStretchWithOverflow=\"true\">
					<reportElement stretchType=\"RelativeToTallestObject\" mode=\"Transparent\" x=\"618\" y=\"0\" width=\"62\" height=\"27\" uuid=\"9913033e-6507-4183-beae-2e44e199cdd7\"/>
					<box topPadding=\"1\" leftPadding=\"4\" bottomPadding=\"1\" rightPadding=\"1\">
						<pen lineWidth=\"1.0\"/>
						<topPen lineWidth=\"1.0\"/>
						<leftPen lineWidth=\"1.0\"/>
						<bottomPen lineWidth=\"1.0\"/>
						<rightPen lineWidth=\"1.0\"/>
					</box>
					<textElement textAlignment=\"Left\" verticalAlignment=\"Middle\"/>
					<textFieldExpression><![CDATA[\$F{exemplo}]]></textFieldExpression>
				</textField>
				<textField isStretchWithOverflow=\"true\">
					<reportElement stretchType=\"RelativeToTallestObject\" mode=\"Transparent\" x=\"680\" y=\"0\" width=\"77\" height=\"27\" uuid=\"708fdea0-7ad7-49fb-bab2-82685a7cff0f\"/>
					<box topPadding=\"1\" leftPadding=\"4\" bottomPadding=\"1\" rightPadding=\"1\">
						<pen lineWidth=\"1.0\"/>
						<topPen lineWidth=\"1.0\"/>
						<leftPen lineWidth=\"1.0\"/>
						<bottomPen lineWidth=\"1.0\"/>
						<rightPen lineWidth=\"1.0\"/>
					</box>
					<textElement textAlignment=\"Left\" verticalAlignment=\"Middle\"/>
					<textFieldExpression><![CDATA[\$F{exemplo}]]></textFieldExpression>
				</textField>
			</band>
		</detail>
		<pageFooter>
			<band height=\"41\" splitType=\"Stretch\">
				<textField>
					<reportElement x=\"0\" y=\"1\" width=\"758\" height=\"20\" uuid=\"4367689d-ec53-4f5f-a513-a3a456582dfd\"/>
					<box topPadding=\"1\" leftPadding=\"1\" bottomPadding=\"1\" rightPadding=\"1\">
						<pen lineWidth=\"1.0\"/>
						<topPen lineWidth=\"1.0\"/>
						<leftPen lineWidth=\"1.0\"/>
						<bottomPen lineWidth=\"1.0\"/>
						<rightPen lineWidth=\"1.0\"/>
					</box>
					<textElement textAlignment=\"Center\" verticalAlignment=\"Middle\"/>
					<textFieldExpression><![CDATA[\$P{endereco}]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x=\"0\" y=\"21\" width=\"303\" height=\"20\" uuid=\"ee7ef1eb-8688-46f0-acaa-4d7b591658bd\"/>
					<box topPadding=\"1\" leftPadding=\"1\" bottomPadding=\"1\" rightPadding=\"1\">
						<pen lineWidth=\"1.0\"/>
						<topPen lineWidth=\"1.0\"/>
						<leftPen lineWidth=\"1.0\"/>
						<bottomPen lineWidth=\"1.0\"/>
						<rightPen lineWidth=\"1.0\"/>
					</box>
					<textElement verticalAlignment=\"Middle\"/>
					<textFieldExpression><![CDATA[\$P{sistema}]]></textFieldExpression>
				</textField>
				<textField pattern=\"dd/MM/yyyy HH.mm \">
					<reportElement x=\"303\" y=\"21\" width=\"144\" height=\"20\" uuid=\"b345b0e7-b783-4d24-bfa0-66dbeb1d2f4b\"/>
					<box topPadding=\"1\" leftPadding=\"1\" bottomPadding=\"1\" rightPadding=\"1\">
						<pen lineWidth=\"1.0\"/>
						<topPen lineWidth=\"1.0\"/>
						<leftPen lineWidth=\"1.0\"/>
						<bottomPen lineWidth=\"1.0\"/>
						<rightPen lineWidth=\"1.0\"/>
					</box>
					<textElement textAlignment=\"Center\" verticalAlignment=\"Middle\"/>
					<textFieldExpression><![CDATA[new java.util.Date()]]></textFieldExpression>
				</textField>
				<textField>
					<reportElement x=\"447\" y=\"21\" width=\"268\" height=\"20\" uuid=\"99167bc8-b79c-4d39-b6ef-9af11c194fbd\"/>
					<box topPadding=\"1\" leftPadding=\"1\" bottomPadding=\"1\" rightPadding=\"1\">
						<pen lineWidth=\"1.0\"/>
						<topPen lineWidth=\"1.0\"/>
						<leftPen lineWidth=\"1.0\"/>
						<bottomPen lineWidth=\"1.0\"/>
						<rightPen lineWidth=\"0.0\"/>
					</box>
					<textElement textAlignment=\"Right\" verticalAlignment=\"Middle\"/>
					<textFieldExpression><![CDATA[\"Página \"+\$V{PAGE_NUMBER}+\" de\"]]></textFieldExpression>
				</textField>
				<textField evaluationTime=\"Report\">
					<reportElement x=\"715\" y=\"21\" width=\"43\" height=\"20\" uuid=\"73412b04-8eac-4140-a592-9771d5f2f086\"/>
					<box topPadding=\"1\" leftPadding=\"1\" bottomPadding=\"1\" rightPadding=\"1\">
						<pen lineWidth=\"1.0\"/>
						<topPen lineWidth=\"1.0\"/>
						<leftPen lineWidth=\"0.0\"/>
						<bottomPen lineWidth=\"1.0\"/>
						<rightPen lineWidth=\"1.0\"/>
					</box>
					<textElement textAlignment=\"Left\" verticalAlignment=\"Middle\"/>
					<textFieldExpression><![CDATA[\" \" + \$V{PAGE_NUMBER}]]></textFieldExpression>
				</textField>
			</band>
		</pageFooter>
</jasperReport>" >> "./relatorio.jrxml";
