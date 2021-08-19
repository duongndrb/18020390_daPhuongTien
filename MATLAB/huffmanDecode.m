function output = huffmanDecode(inputimg, table)
    decode = '';
    index = 1;
    l = length(table);
    root = dlnode(-1,-1);
    
    for i=1 : l
        if ~isempty(table{i})
             root = makehuffmantree(root, i-1, table{i});
        end
    end
    
    r = root;
    while length(inputimg) > 2
        if isempty(decode)
            decode = strcat(decode,dec2bin(inputimg(1),8));
            inputimg(1)=[];
        end
        
        if decode(1) == '0'
            r = r.Left;
        elseif decode(1) == '1'
            r = r.Right;
        end
        decode(1) = [];
        
        if isLeafNode(r)
            output(index) = uint8(r.Data);
            index = index + 1;
            r = root;
        end
    end
    
    if ~isempty(inputimg)
        decode = strcat(decode,dec2bin(inputimg(1),inputimg(2)));
    end
    
    while ~isempty(decode)
        if isempty(decode)
            decode = strcat(decode,dec2bin(inputimg(1),8));
            inputimg(1)=[];
        end
        
        if decode(1) == '0'
            r = r.Left;
        elseif decode(1) == '1'
            r = r.Right;
        end
        decode(1) = [];
        
        if isLeafNode(r)
            output(index) = uint8(r.Data);
            index = index + 1;
            r = root;
        end
    end
end

function output = makehuffmantree(root, data, code)
    if isempty(code)
        root.Data = data;
    
    else
        if code(1) == '0'
            if isempty(root.Left)
                insertLeft(dlnode(-1,-1), root);
            end
            makehuffmantree(root.Left, data, code(2:length(code)));
            
        elseif code(1) == '1'
            if isempty(root.Right)
                insertRight(dlnode(-1,-1), root);
            end
            makehuffmantree(root.Right, data, code(2:length(code)));
        end
    end
    
    output = root;
end

function output = isLeafNode(node)
    output = isempty(node.Left) & isempty(node.Right);
end