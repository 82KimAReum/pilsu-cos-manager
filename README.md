
<img src='./images/0001.jpg'/>
<img src='./images/0002.jpg'/>
<img src='./images/0003.jpg'/>
<img src='./images/0004.jpg'/>
<img src='./images/0005.jpg'/>
<img src='./images/0006.jpg'/>
<img src='./images/0007.jpg'/>
<img src='./images/0008.jpg'/>
<img src='./images/0009.jpg'/>
<img src='./images/0010.jpg'/>
<img src='./images/0011.jpg'/>
<img src='./images/0012.jpg'/>
<img src='./images/0013.jpg'/>
<img src='./images/0014.jpg'/>
<img src='./images/0015.jpg'/>
<img src='./images/0016.jpg'/>
<img src='./images/0017.jpg'/>
<img src='./images/0018.jpg'/>
<img src='./images/0019.jpg'/>
<img src='./images/0020.jpg'/>
<img src='./images/0021.jpg'/>
<img src='./images/0022.jpg'/>
<img src='./images/0023.jpg'/>
<img src='./images/0024.jpg'/>
<img src='./images/0025.jpg'/>
<img src='./images/0026.jpg'/>
<img src='./images/0027.jpg'/>
<img src='./images/0028.jpg'/>
<img src='./images/0029.jpg'/>
<img src='./images/0030.jpg'/>
<img src='./images/0031.jpg'/>
<img src='./images/0032.jpg'/>
<img src='./images/0033.jpg'/>
<img src='./images/0034.jpg'/>
<img src='./images/0035.jpg'/>
<img src='./images/0036.jpg'/>
<img src='./images/0037.jpg'/>
<img src='./images/0038.jpg'/>
<img src='./images/0039.jpg'/>
<img src='./images/0040.jpg'/>
<img src='./images/0041.jpg'/>
<img src='./images/0042.jpg'/>
<img src='./images/0043.jpg'/>
<img src='./images/0044.jpg'/>
<img src='./images/0045.jpg'/>
<img src='./images/0046.jpg'/>
<img src='./images/0047.jpg'/>
<img src='./images/0048.jpg'/>
<img src='./images/0049.jpg'/>
<img src='./images/0050.jpg'/>
<img src='./images/0051.jpg'/>
<img src='./images/0052.jpg'/>
<img src='./images/0053.jpg'/>
<img src='./images/0054.jpg'/>
<img src='./images/0055.jpg'/>
<img src='./images/0056.jpg'/>
<img src='./images/0057.jpg'/>
<img src='./images/0058.jpg'/>
<img src='./images/0059.jpg'/>
<img src='./images/0060.jpg'/>
<img src='./images/0061.jpg'/>
<img src='./images/0062.jpg'/>
<img src='./images/0063.jpg'/>
<img src='./images/0064.jpg'/>
<img src='./images/0065.jpg'/>
<img src='./images/0066.jpg'/>
<img src='./images/0067.jpg'/>
<img src='./images/0068.jpg'/>

<pre>



site<-"https://www.glowpick.com/brand/ranking?id=34&main_category_id=1&sub_category_id=4"
text<-read_html(site,encoding="UTF-8")
a<-html_nodes(text,".prod-link")
a<-html_attr(a,"href")

cos_myinfo<-NULL
for(i in 1:25){
  b<-a[i]
  url<-paste("https://www.glowpick.com",b,sep="")
  url<-read_html(url,encoding="UTF-8")
  name<-html_nodes(url,".pdt-name")
  name<-html_text(name)
  info<-html_nodes(url,".pdt-info")
  info<-html_text(info)
  brand<-html_nodes(url,".brand-name")
  brand<-html_text(brand)
  dsc<-html_nodes(url,".txt")
  dsc<-html_text(dsc)
  dsc<-gsub("\r\n","",dsc)
  dsc<-gsub("\n","",dsc)
  dsc<-gsub("¢â","",dsc)
  img<-html_nodes(url,".pdt-img img")
  img<-html_attr(img,"src")
  myinfo<-cbind(name,info)
  myinfo<-cbind(myinfo,brand)
  myinfo<-cbind(myinfo,dsc)
  myinfo<-cbind(myinfo,img)
  cos_myinfo<-rbind(cos_myinfo,myinfo)
}
write.csv(cos_myinfo,"cos_skinfood_creamgel.csv")


</pre>
