function allpairprediction(list, PD, vectorPOLY, bag, trainedModel, address)
	list = split(list);
	ls = length(list);
	news = list(:,1);
	newa = list(:,2);	
	for i=1:ls
		sd = news(i);
		ad = newa(i);
		y1 = vectorPOLY.Edges(find(vectorPOLY.Edges.EndNodes(:,2)==sd),:);
		y2 = vectorPOLY.Edges(find(vectorPOLY.Edges.EndNodes(:,2)==ad),:);
		y = [y1;y2];
		at = table2array(y);
		at = replace(at, sd, "PD");
		at = replace(at, ad, "VD");
		pd = PD.action(find(PD.pd1==sd & PD.vd1==ad));
		if ~isempty(pd);
			dddd(i) = strcat(join(join(at,""))," ",pd);
		else
			dddd(i) = join(join(at,""));
		end
	end
	dddddocuments = tokenizedDocument(dddd);
	enc = normalize(tfidf(bag,dddddocuments),2);
	vector=full(enc);
	ll = trainedModel.predictFcn(vector);
	fp = 2.^ll;
	t = [news newa fp];
	writematrix(t,address,'Delimiter','tab');	
end
